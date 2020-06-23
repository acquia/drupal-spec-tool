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
    1. [Name the current version](https://support.google.com/docs/answer/190843) of the document the new release version number.
    1. [Make a copy](https://support.google.com/docs/answer/49114) of the document and...
        1. Name it "Drupal Spec Tool $VERSION (current)", e.g., "Drupal Spec Tool v2.0.0 (current)".
        1. Share it with the same people.
1. In the new document, [get a shareable link](https://support.google.com/docs/answer/2494822) for use in the following steps.
1. Update the link to "the current version of the Google sheet" in the [README](README.md).
1. Send the document ID from the new link to the Acquia Professional Services, Operations team to update the Project Template.
1. In [.github_changelog_generator](.github_changelog_generator), set the value of `future-release` to the new release version number.
1. Run `github_changelog_generator` from the root directory.
1. Commit code changes and push to GitHub.
1. [Create a release](https://help.github.com/articles/creating-releases/) on GitHub and...
    1. Set the tag version and release title both to the new release version number.
    1. Use the following template for the description. See [v2.0.0](https://github.com/acquia/drupal-spec-tool/releases/tag/v2.0.0) for an example.
        ```
        [Google Sheet]($URL)

        $VERSION_DETAILS_FROM_CHANGELOG_DOT_MD
        ```
1. Confirm that the [Packagist package](https://packagist.org/packages/acquia/drupal-spec-tool) detects the new version.
