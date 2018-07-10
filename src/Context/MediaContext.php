<?php

namespace Acquia\DrupalSpecTool\Context;

use Behat\Gherkin\Node\TableNode;
use TravisCarden\BehatTableComparison\TableEqualityAssertion;

/**
 * Provides content model Behat step definitions.
 */
class MediaContext extends ContextBase {

  /**
   * The image effect manager.
   *
   * @var \Drupal\image\ImageEffectManager
   */
  private $imageEffectManager;

  /**
   * The renderer.
   *
   * @var \Drupal\Core\Render\RendererInterface
   */
  private $renderer;

  /**
   * Constructs a MediaContext.
   */
  public function __construct() {
    parent::__construct();
    $this->imageEffectManager = \Drupal::service('plugin.manager.image.effect');
    $this->renderer = \Drupal::service('renderer');
  }

  /**
   * Asserts the configuration of image styles.
   *
   * @Then exactly the following image styles should exist
   *
   * @throws \Exception
   */
  public function assertImageStyles(TableNode $expected) {
    $image_style_info = [];
    foreach ($this->getImageStyles() as $image_style) {
      $image_style_info[] = [
        $image_style->label(),
        $image_style->id(),
      ];
    }
    $actual = new TableNode($image_style_info);

    (new TableEqualityAssertion($expected, $actual))
      ->expectHeader([
        'Style name',
        'Machine name',
      ])
      ->ignoreRowOrder()
      ->setMissingRowsLabel(self::missingRowsLabelFor('workflow'))
      ->setUnexpectedRowsLabel(self::unexpectedRowsLabelFor('workflow'))
      ->assert();
  }

  /**
   * Asserts the configuration of image effects.
   *
   * @Then exactly the following image effects should exist
   *
   * @throws \Exception
   */
  public function assertImageEffects(TableNode $expected) {
    $image_style_info = [];
    foreach ($this->getImageStyles() as $image_style) {
      foreach ($image_style->getEffects() as $effect) {
        $image_style_info[] = [
          $image_style->label(),
          (string) $effect->label(),
          $this->formatImageEffectSummary($effect->getSummary()),
        ];
      }
    }
    $actual = new TableNode($image_style_info);

    (new TableEqualityAssertion($expected, $actual))
      ->expectHeader([
        'Image style',
        'Effect',
        'Summary',
      ])
      ->setMissingRowsLabel(self::missingRowsLabelFor('workflow'))
      ->setUnexpectedRowsLabel(self::unexpectedRowsLabelFor('workflow'))
      ->assert();
  }

  /**
   * Gets all defined image style objects.
   *
   * @return \Drupal\image\ImageStyleInterface[]
   *   Returns an array of image style objects.
   *
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   */
  private function getImageStyles() {
    /** @var \Drupal\image\ImageStyleInterface[] $image_styles */
    $image_styles = $this->entityTypeManager()
      ->getStorage('image_style')
      ->loadMultiple();
    return $image_styles;
  }

  /**
   * Formats an image effect summary for use in a Gherkin data table.
   *
   * @param array $summary
   *   An image effect summary render array.
   *
   * @return string
   *   The summary formatted for use in a Gherkin data table.
   */
  private function formatImageEffectSummary(array $summary) {
    $rendered = (string) $this->renderer->renderPlain($summary);
    $plaintext = strip_tags($rendered);
    $trimmed = trim($plaintext);
    $one_line = preg_replace('/[ \n]+/', ' ', $trimmed);
    return $one_line;
  }

}
