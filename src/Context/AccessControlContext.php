<?php

namespace Acquia\DrupalSpecTool\Context;

use Behat\Gherkin\Node\TableNode;
use TravisCarden\BehatTableComparison\TableEqualityAssertion;

/**
 * Provides access control Behat step definitions.
 */
class AccessControlContext extends ContextBase {

  /**
   * Asserts the configuration of roles.
   *
   * @Then exactly the following roles should exist
   *
   * @throws \Exception
   */
  public function assertRolesExist(TableNode $expected) {
    $role_info = [];
    /** @var \Drupal\user\Entity\Role[] $roles */
    $roles = $this->entityTypeManager()
      ->getStorage('user_role')
      ->loadMultiple();
    foreach ($roles as $id => $role) {
      $role_info[] = [$role->label(), $id];
    }
    $actual = new TableNode($role_info);

    (new TableEqualityAssertion($expected, $actual))
      ->expectHeader(['Name', 'Machine name'])
      ->ignoreRowOrder()
      ->setMissingRowsLabel(self::missingRowsLabelFor('roles'))
      ->setUnexpectedRowsLabel(self::unexpectedRowsLabelFor('roles'))
      ->assert();
  }

}
