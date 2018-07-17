# Acquia Drupal Spec Tool

[![Packagist](https://img.shields.io/packagist/v/acquia/drupal-spec-tool.svg)](https://packagist.org/packages/acquia/drupal-spec-tool)

This project provides a tool for specifying Drupal architecture details and generating automated tests for them. It consists of 1) a Google Sheet for capturing specification and generating tests from it and 2) the Behat contexts that automate the generated tests.

## Getting started

### Google sheet

Copy [the current version of the Google sheet](https://docs.google.com/spreadsheets/d/1h-SieCV9Dtrj8F4bqMvsbcHwIibN30j2oR9FMRDFT-8/edit?usp=sharing) to your Google Drive.

![Google Sheet Screenshot](resources/screenshot.png)

### Behat tests

Assuming you already have [Behat installed](http://behat.org/en/latest/quick_start.html#installation) via [Composer](https://getcomposer.org/)...

1. Install the Behat contexts:

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
            - Acquia\DrupalSpecTool\Context\MediaContext
            - Acquia\DrupalSpecTool\Context\MenuContext
            - Acquia\DrupalSpecTool\Context\ViewsContext
            - Acquia\DrupalSpecTool\Context\WorkflowContext
    ```

1. Create a [Behat feature](http://behat.org/en/latest/user_guide/features_scenarios.html) file for each generated feature on the "Behat" tab of the Google sheet (e.g., `content_model.feature`) and copy the Gherkin into it.

1. Run Behat! If the tests pass, your application already matches the specification. If not, change one or the other according to your needs.

## Usage

Learn more about the features of the tool and best practices for using it in [the announcement blog post on the Acquia Developer Center](https://dev.acquia.com/blog/a-specification-tool-for-drupal-8-/30/05/2018/19606).

## Known issues

[See open bug reports in the issue queue.](https://github.com/acquia/drupal-spec-tool/labels/bug)

## Contribution

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Copyright (C) 2018 Acquia, Inc.

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 2 as published by the Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
