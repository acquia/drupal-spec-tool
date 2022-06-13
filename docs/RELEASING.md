# Releasing a New Version

For project maintainers.

1. Before committing to a release...
    1. [Check the issue queue](https://github.com/acquia/drupal-spec-tool/issues) for critical issues and address as necessary.
    1. Search the codebase for `@todo` comments and address as necessary.
1. [Rename](https://support.google.com/docs/answer/49114) the current version of the Google sheet (find the link in the [README](README.md)), replacing the word "current" with "old", e.g., "Drupal Spec Tool v1.0.0 (old)".
1. Choose a new release version number according to the [Semantic Versioning Specification](https://semver.org/) (e.g., v2.0.0) for use in the following steps.
1. For a new major version, update `extra.branch-alias.dev-develop` in [composer.json](../composer.json).
1. In the [canonical (master) version of the spreadsheet](https://docs.google.com/spreadsheets/d/1GDNEzJe_rWdM3oG_kbBEH8r11Pcy4a1xJ1oglVBsZRE/edit)...
    1. Update the version number on the "Overview" tab next to "Based on the document template version:" to the new release version number.
    1. [Name the version](https://support.google.com/docs/answer/190843) in the version history accordingly.
    1. [Make a copy](https://support.google.com/docs/answer/49114) of the document and...
        1. Name it "Drupal Spec Tool $VERSION (current)", e.g., "Drupal Spec Tool v2.0.0 (current)".
        1. Share it with the same people.
1. In the new document, [get a shareable link](https://support.google.com/docs/answer/2494822) for use in the following steps.
1. Update the link to "the current version of the Google sheet" in the [README](README.md).
1. Send the document ID from the new link to the Acquia Professional Services, Operations team to update the Project Template.
1. Update [the document overview screenshot](images/screenshot.png).
1. Cut a release using [Gitflow](https://github.com/nvie/gitflow).
1. Push the release to GitHub along with the updated `develop` and `master` branches.
1. [Create a release](https://help.github.com/articles/creating-releases/) on GitHub and...
    1. Set the tag version and release title both to the new release version number.
    2. Press the "Generate release notes" button.
    3. Prepend the description with the following (including the blank line).
        ```
        [Google Sheet]($URL)

        ```
1. Confirm that the [Packagist package](https://packagist.org/packages/acquia/drupal-spec-tool) detects the new version.
1. Notify users as appropriate, e.g., Acquia Professional Services.
