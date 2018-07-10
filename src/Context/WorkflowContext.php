<?php

namespace Acquia\DrupalSpecTool\Context;

use Behat\Gherkin\Node\TableNode;
use TravisCarden\BehatTableComparison\TableEqualityAssertion;

/**
 * Provides content model Behat step definitions.
 */
class WorkflowContext extends ContextBase {

  /**
   * The workflow type manager.
   *
   * @var \Drupal\workflows\WorkflowTypeManager
   */
  private $workflowTypeManager;

  /**
   * Constructs a WorkflowContext.
   */
  public function __construct() {
    parent::__construct();
    $this->workflowTypeManager = \Drupal::service('plugin.manager.workflows.type');
  }

  /**
   * Asserts the configuration of workflows.
   *
   * @Then exactly the following workflows should exist
   *
   * @throws \Exception
   */
  public function assertWorkflows(TableNode $expected) {
    $workflow_info = [];
    foreach ($this->getWorkflows() as $workflow) {
      $workflow_info[] = [
        $workflow->label(),
        $workflow->id(),
        (string) $workflow->getTypePlugin()->label(),
      ];
    }
    $actual = new TableNode($workflow_info);

    (new TableEqualityAssertion($expected, $actual))
      ->expectHeader([
        'Label',
        'Machine name',
        'Type',
      ])
      ->ignoreRowOrder()
      ->setMissingRowsLabel(self::missingRowsLabelFor('workflow'))
      ->setUnexpectedRowsLabel(self::unexpectedRowsLabelFor('workflow'))
      ->assert();
  }

  /**
   * Asserts the configuration of workflow states.
   *
   * @Then exactly the following workflow states should exist
   *
   * @throws \Exception
   */
  public function assertWorkflowStates(TableNode $expected) {
    $states_info = [];
    foreach ($this->getWorkflows() as $workflow) {
      /** @var \Drupal\workflows\StateInterface[] $states */
      $states = $workflow->getTypePlugin()->getStates();
      foreach ($states as $state) {
        $states_info[] = [
          $workflow->label(),
          $state->label(),
          $state->id(),
        ];
      }
    }
    $actual = new TableNode($states_info);

    (new TableEqualityAssertion($expected, $actual))
      ->expectHeader([
        'Workflow',
        'Label',
        'Machine name',
      ])
      ->ignoreRowOrder()
      ->setMissingRowsLabel(self::missingRowsLabelFor('workflow states'))
      ->setUnexpectedRowsLabel(self::unexpectedRowsLabelFor('workflow states'))
      ->assert();
  }

  /**
   * Asserts the configuration of workflow transitions.
   *
   * @Then exactly the following workflow transitions should exist
   *
   * @throws \Exception
   */
  public function assertWorkflowTransitions(TableNode $expected) {
    $states_info = [];
    foreach ($this->getWorkflows() as $workflow) {

      /** @var \Drupal\workflows\TransitionInterface[] $transitions */
      $transitions = $workflow->getTypePlugin()->getTransitions();
      foreach ($transitions as $transition) {
        foreach ($transition->from() as $from_state) {

          $states_info[] = [
            $workflow->label(),
            $transition->label(),
            $transition->id(),
            $from_state->label(),
            $transition->to()->label(),
          ];
        }

      }
    }
    $actual = new TableNode($states_info);

    (new TableEqualityAssertion($expected, $actual))
      ->expectHeader([
        'Workflow',
        'Label',
        'Machine name',
        'From state',
        'To state',
      ])
      ->ignoreRowOrder()
      ->setMissingRowsLabel(self::missingRowsLabelFor('workflow states'))
      ->setUnexpectedRowsLabel(self::unexpectedRowsLabelFor('workflow states'))
      ->assert();
  }

  /**
   * Gets all defined workflow objects.
   *
   * @return \Drupal\workflows\WorkflowInterface[]
   *   Returns an array of workflow objects.
   *
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   */
  private function getWorkflows() {
    /** @var \Drupal\workflows\WorkflowInterface[] $workflows */
    $workflows = $this->entityTypeManager()
      ->getStorage('workflow')
      ->loadMultiple();
    return $workflows;
  }

}
