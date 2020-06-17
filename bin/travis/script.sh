#!/usr/bin/env bash

# NAME
#     script.sh - Run Behat tests.
#
# SYNOPSIS
#     script.sh
#
# DESCRIPTION
#     Runs the Drupal Spec Tool's Lightning/Spreadsheet/Behat integration tests.

cd "$(dirname "$0")" || exit 1; source _includes.sh

# Exit early on standard ORCA jobs.
[[ ! "$BEHAT" == "TRUE" ]] && exit

cd "$ORCA_FIXTURE_DIR" || exit 1

./vendor/bin/behat --config=vendor/acquia/drupal-spec-tool/behat.yml
