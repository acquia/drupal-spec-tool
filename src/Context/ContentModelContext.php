<?php

namespace Acquia\DrupalSpecTool\Context;

use Behat\Gherkin\Node\TableNode;
use Drupal\Component\Plugin\Exception\PluginNotFoundException;
use Drupal\Core\Entity\Entity\EntityFormDisplay;
use Drupal\field\Entity\FieldConfig;
use TravisCarden\BehatTableComparison\TableEqualityAssertion;

/**
 * Provides content model Behat step definitions.
 */
class ContentModelContext extends ContextBase {

  /**
   * The config factory.
   *
   * @var \Drupal\Core\Config\ConfigFactoryInterface
   */
  private $configFactory;

  /**
   * The field type manager.
   *
   * @var \Drupal\Core\Field\FieldTypePluginManagerInterface
   */
  private $fieldTypeManager;

  /**
   * The field widget manager.
   *
   * @var \Drupal\Component\Plugin\PluginManagerInterface
   */
  private $fieldWidgetManager;

  /**
   * Constructs a ContentModelContext.
   */
  public function __construct() {
    parent::__construct();
    $this->configFactory = \Drupal::configFactory();
    $this->fieldTypeManager = \Drupal::service('plugin.manager.field.field_type');
    $this->fieldWidgetManager = \Drupal::service('plugin.manager.field.widget');
  }

  /**
   * Asserts the configuration of content entity type bundles.
   *
   * @Then exactly the following content entity type bundles should exist
   *
   * @throws \Exception
   */
  public function assertBundles(TableNode $expected) {
    $bundle_info = [];
    foreach ($this->getContentEntityTypes() as $entity_type) {
      $bundles = $this->entityTypeManager()
        ->getStorage($entity_type->getBundleEntityType())
        ->loadMultiple();
      foreach ($bundles as $bundle) {
        $description = '';
        $description_getter = 'getDescription';
        if (method_exists($bundle, $description_getter)) {
          $description = call_user_func([
            $bundle,
            $description_getter,
          ]);
        }
        if (!isset($description) || !$description) {
          $description = '';
        }

        $bundle_info[] = [
          $bundle->label(),
          $bundle->id(),
          $entity_type->getBundleLabel(),
          $description,
        ];
      }
    }
    $actual = new TableNode($bundle_info);

    (new TableEqualityAssertion($expected, $actual))
      ->expectHeader([
        'Name',
        'Machine name',
        'Type',
        'Description',
      ])
      ->ignoreRowOrder()
      ->setMissingRowsLabel(self::missingRowsLabelFor('bundles'))
      ->setUnexpectedRowsLabel(self::unexpectedRowsLabelFor('bundles'))
      ->assert();
  }

  /**
   * Asserts the configuration of fields on select content entity types.
   *
   * @Then exactly the following fields should exist
   *
   * @throws \Exception
   *
   * @see ContentModelContext::getContentEntityTypes
   */
  public function assertFields(TableNode $expected) {
    $fields = [];
    foreach ($this->getContentEntityTypes() as $entity_type) {
      $bundles = $this->entityTypeManager()
        ->getStorage($entity_type->getBundleEntityType())
        ->loadMultiple();
      foreach ($bundles as $bundle) {
        /** @var string[] $ids */
        $ids = \Drupal::entityQuery('field_config')
          ->condition('bundle', $bundle->id())
          ->condition('entity_type', $entity_type->id())
          ->execute();

        if (!$ids) {
          continue;
        }

        $display_id = "{$entity_type->id()}.{$bundle->id()}.default";
        $form_display = EntityFormDisplay::load($display_id);
        if (is_null($form_display)) {
          throw new \Exception(sprintf('No such form display: %s. Try saving the "Manage form display" form for the "%s" %s.', $display_id, $bundle->label(), strtolower($entity_type->getBundleLabel())));
        }
        $form_components = $form_display->getComponents();

        /** @var \Drupal\field\FieldConfigInterface $field_config */
        foreach (FieldConfig::loadMultiple($ids) as $id => $field_config) {
          $machine_name = $this->getFieldMachineNameFromConfigId($id);
          $field_storage = $field_config->getFieldStorageDefinition();
          $fields[] = [
            $entity_type->getBundleLabel(),
            $bundle->label(),
            $field_config->getLabel(),
            $machine_name,
            (string) $this->fieldTypeManager->getDefinition($field_config->getType())['label'],
            $field_config->isRequired() ? 'Required' : '',
            $field_storage->getCardinality() === -1 ? 'Unlimited' : $field_storage->getCardinality(),
            isset($form_components[$machine_name]['type']) ? (string) $this->fieldWidgetManager->getDefinition($form_components[$machine_name]['type'])['label'] : '-- Disabled --',
            $field_config->isTranslatable() ? 'Translatable' : '',
            $field_config->getDescription(),
          ];
        }
      }
    }
    $actual = new TableNode($fields);

    (new TableEqualityAssertion($expected, $actual))
      ->expectHeader([
        'Type',
        'Bundle',
        'Field label',
        'Machine name',
        'Field type',
        'Required',
        'Cardinality',
        'Form widget',
        'Translatable',
        'Help text',
      ])
      ->ignoreRowOrder()
      ->setMissingRowsLabel(self::missingRowsLabelFor('fields'))
      ->setUnexpectedRowsLabel(self::unexpectedRowsLabelFor('fields'))
      ->assert();
  }

  /**
   * Gets the content entity types of interest.
   *
   * @return \Drupal\Core\Entity\EntityTypeInterface[]
   *   An array of entity types.
   */
  protected function getContentEntityTypes() {
    $ids = [
      'block_content',
      'media',
      'node',
      'paragraph',
      'taxonomy_term',
    ];
    $entity_types = [];
    foreach ($ids as $id) {
      try {
        $entity_types[] = $this->entityTypeManager()->getDefinition($id);
      }
      catch (PluginNotFoundException $e) {
        // A PluginNotFoundException here just means that the module providing
        // the entity type in question isn't installed. Continue.
      }
    }
    return $entity_types;
  }

  /**
   * Gets the field machine name from a configuration object ID.
   *
   * @param string $id
   *   The field configuration object ID.
   *
   * @return string|false
   *   The machine name if found or FALSE if not.
   */
  protected function getFieldMachineNameFromConfigId($id) {
    return substr($id, strrpos($id, '.') + 1);
  }

}
