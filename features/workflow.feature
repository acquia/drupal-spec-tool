@api
Feature: Workflow
  In order to ensure its readiness and compliance
  As a site owner
  I want my content to go through workflow prior to publication.

  Scenario: Workflow
    Then exactly the following workflows should exist
      | Label     | Machine name | Type               |
      | Editorial | editorial    | Content moderation |

  Scenario: Workflow states
    Then exactly the following workflow states should exist
      | Workflow  | Label     | Machine name |
      | Editorial | Archived  | archived     |
      | Editorial | Draft     | draft        |
      | Editorial | In review | review       |
      | Editorial | Published | published    |

  Scenario: Workflow transitions
    Then exactly the following workflow transitions should exist
      | Workflow  | Label                | Machine name       | From state | To state  |
      | Editorial | Archive              | archive            | Published  | Archived  |
      | Editorial | Create New Draft     | create_new_draft   | Archived   | Draft     |
      | Editorial | Create New Draft     | create_new_draft   | Draft      | Draft     |
      | Editorial | Create New Draft     | create_new_draft   | In review  | Draft     |
      | Editorial | Create New Draft     | create_new_draft   | Published  | Draft     |
      | Editorial | Publish              | publish            | Draft      | Published |
      | Editorial | Publish              | publish            | In review  | Published |
      | Editorial | Publish              | publish            | Published  | Published |
      | Editorial | Restore from archive | archived_published | Archived   | Published |
      | Editorial | Send to review       | review             | Draft      | In review |
      | Editorial | Send to review       | review             | In review  | In review |
