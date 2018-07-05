<?php

namespace Acquia\DrupalSpecTool\Context;

use Behat\Gherkin\Node\TableNode;
use TravisCarden\BehatTableComparison\TableEqualityAssertion;

/**
 * Provides access control Behat step definitions.
 */
class MenuContext extends BaseContext {

  /**
   * The entity type manager.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  private $entityTypeManager;

  /**
   * Constructs a ContentModelContext.
   */
  public function __construct() {
    $this->entityTypeManager = \Drupal::entityTypeManager();
  }

  /**
   * Asserts the configuration of menus.
   *
   * @Then exactly the following menus should exist
   *
   * @throws \Exception
   */
  public function assertMenusExist(TableNode $expected) {
    $menu_info = [];
    /** @var \Drupal\system\Entity\Menu $menu */
    $menus = $this->entityTypeManager
      ->getStorage('menu')
      ->loadMultiple();
    foreach ($menus as $id => $menu) {
      $menu_info[] = [$menu->label(), $id, $menu->getDescription()];
    }
    $actual = new TableNode($menu_info);

    (new TableEqualityAssertion($expected, $actual))
      ->expectHeader(['Name', 'Machine name', 'Description'])
      ->ignoreRowOrder()
      ->setMissingRowsLabel(self::missingRowsLabelFor('menus'))
      ->setUnexpectedRowsLabel(self::unexpectedRowsLabelFor('menus'))
      ->assert();
  }

}
