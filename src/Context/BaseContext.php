<?php

namespace Acquia\DrupalSpecTool\Context;

use Behat\Behat\Context\Context;
use Drupal\DrupalExtension\Context\RawDrupalContext;

/**
 * Defines a base context implementation that most context classes will extend.
 */
abstract class BaseContext extends RawDrupalContext {

  /**
   * Returns a "missing rows" label value for a given plural name.
   *
   * @param string $plural_name
   *   The plural name for rows indicating what they signify, e.g., "bundles" or
   *   "fields".
   *
   * @return string
   *   The label value.
   */
  protected static function missingRowsLabelFor($plural_name) {
    return sprintf('Missing %s (present in specification, absent from Drupal)', $plural_name);
  }

  /**
   * Returns an "unexpected rows" label value for a given plural name.
   *
   * @param string $plural_name
   *   The plural name for rows indicating what they signify, e.g., "bundles" or
   *   "fields".
   *
   * @return string
   *   The label value.
   */
  protected static function unexpectedRowsLabelFor($plural_name) {
    return sprintf('Unexpected %s (present in Drupal, absent from specification)', $plural_name);
  }

}
