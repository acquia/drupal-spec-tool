<?php

namespace Acquia\DrupalSpecTool\Context;

use Behat\Gherkin\Node\TableNode;
use Drupal\user\Entity\Role;
use TravisCarden\BehatTableComparison\TableEqualityAssertion;

/**
 * Provides access control Behat step definitions.
 */
class AccessControlContext extends BaseContext {

  /**
   * Asserts the configuration of roles.
   *
   * @Then exactly the following roles should exist
   */
  public function assertRolesExist(TableNode $expected) {
    $roles = [];
    /** @var \Drupal\user\Entity\Role $role */
    foreach (Role::loadMultiple() as $id => $role) {
      $roles[] = [$role->label(), $id];
    }
    $actual = new TableNode($roles);

    (new TableEqualityAssertion($expected, $actual))
      ->expectHeader(['Name', 'Machine name'])
      ->ignoreRowOrder()
      ->setMissingRowsLabel(self::missingRowsLabelFor('roles'))
      ->setUnexpectedRowsLabel(self::unexpectedRowsLabelFor('roles'))
      ->assert();
  }

}
