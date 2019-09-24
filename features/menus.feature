@api
Feature: Menus
  In order to organize my content hierarchically
  As a content editor
  I want to have menus that reflect my information architecture.

  Scenario: Menus
    Then exactly the following menus should exist
      | Name              | Machine name | Description                              |
      | Administration    | admin        | Administrative task links                |
      | Footer            | footer       | Site information links                   |
      | Main navigation   | main         | Site section links                       |
      | Tools             | tools        | User tool links, often added by modules  |
      | User account menu | account      | Links related to the active user account |
