<?php

namespace Acquia\DrupalSpecTool\Context;

use Behat\Gherkin\Node\TableNode;
use TravisCarden\BehatTableComparison\TableEqualityAssertion;

/**
 * Provides Views Behat step definitions.
 */
class ViewsContext extends BaseContext {

  /**
   * The list of Views base tables.
   *
   * @var array|string[]
   */
  private $baseTables;

  /**
   * The entity type manager.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  private $entityTypeManager;

  /**
   * The Views wizard manager.
   *
   * @var \Drupal\views\Annotation\ViewsWizard
   */
  private $viewsWizardManager;

  /**
   * Constructs a ContentModelContext.
   */
  public function __construct() {
    $this->entityTypeManager = \Drupal::entityTypeManager();
    $this->viewsWizardManager = \Drupal::getContainer()
      ->get('plugin.manager.views.wizard');
    $this->baseTables = $this->getAllBaseTables();
  }

  /**
   * Asserts the configuration of views.
   *
   * @Then exactly the following views should exist
   *
   * @throws \Exception
   */
  public function assertViewsExist(TableNode $expected) {
    $views_info = [];
    /** @var \Drupal\views\Entity\View $view */
    $views = $this->entityTypeManager
      ->getStorage('view')
      ->loadMultiple();
    foreach ($views as $id => $view) {
      $views_info[] = [
        $view->label(),
        $id,
        $this->getBaseTableLabel($view->get('base_table')),
        $view->status() ? 'Enabled' : 'Disabled',
        $view->get('description'),
      ];
    }
    $actual = new TableNode($views_info);

    (new TableEqualityAssertion($expected, $actual))
      ->expectHeader([
        'Name',
        'Machine name',
        'Base table',
        'Status',
        'Description',
      ])
      ->ignoreRowOrder()
      ->setMissingRowsLabel(self::missingRowsLabelFor('views'))
      ->setUnexpectedRowsLabel(self::unexpectedRowsLabelFor('views'))
      ->assert();
  }

  /**
   * Gets the list of Views base tables.
   *
   * @return array|string[]
   *   An array of base table human-readable labels keyed by the corresponding
   *   IDs.
   */
  private function getAllBaseTables(): array {
    $base_tables = [];

    /** @var array[] $wizard_plugins */
    $wizard_plugins = $this->viewsWizardManager->getDefinitions();
    foreach ($wizard_plugins as $wizard) {
      if (!array_key_exists('base_table', $wizard)) {
        continue;
      }
      $base_tables[$wizard['base_table']] = (string) $wizard['title'];
    }

    return $base_tables;
  }

  /**
   * Gets the human-readable label for a given base table ID.
   *
   * @param string $id
   *   A base table ID.
   *
   * @return string
   *   A human-readable label for the given base table ID if found, or the ID if
   *   not.
   */
  private function getBaseTableLabel($id) {
    return array_key_exists($id, $this->baseTables) ? $this->baseTables[$id] : $id;
  }

}
