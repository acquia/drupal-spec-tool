# Drupal Spec Tool

This project provides a tool for specifying Drupal architecture details and generating automated tests for them. It consists of 1) a Google Sheet for capturing specification and generating tests from it and 2) the Behat contexts that automate the generated tests.

## Google sheet

Copy [the current version of the Google sheet](https://docs.google.com/spreadsheets/d/1G2LnWLVcZczxjp2SQt7XNjMvdNonmcgjx7RhFm2nhMw/edit?usp=sharing) to your Google Drive.

## Behat contexts

1. Install the Behat contexts via [Composer](https://getcomposer.org/):

    ```bash
    composer require --dev acquia/drupal-spec-tool
    ```

1. Add the new contexts to your [Behat configuration](http://behat.org/en/latest/user_guide/configuration.html), e.g.:

    ```yaml
    # behat.yml
    default:
      suites:
        default:
          contexts:
            - Acquia\DrupalSpecTool\Context\AccessControlContext
            - Acquia\DrupalSpecTool\Context\ContentModelContext
    ```

## And...

More details forthcoming.

## Contribution

All contributions are welcome according to [normal open source practice](https://opensource.guide/how-to-contribute/#how-to-submit-a-contribution).

## License

Copyright (C) 2018 Acquia, Inc.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 2 as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
