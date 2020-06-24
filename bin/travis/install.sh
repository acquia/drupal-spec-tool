#!/usr/bin/env bash

# NAME
#     install.sh - Create the test fixture.
#
# SYNOPSIS
#     install.sh
#
# DESCRIPTION
#     Creates the test fixture and places the SUT.

cd "$(dirname "$0")" || exit 1; source _includes.sh

# Exit early on standard ORCA jobs.
[[ ! "$BEHAT" == "TRUE" ]] && exit

# Create the fixture.
orca fixture:init -f --sut=acquia/drupal-spec-tool --core=~9 --profile=lightning --project-template=acquia/drupal-recommended-project

cd "$ORCA_FIXTURE_DIR" || exit 1

# Delete some Lightning Behat files that cause errors and invalid test failures.
# @todo Coordinate with the Lighthning team to fix this upstream.
find docroot/modules/contrib/lightning_* -name \*.behat.inc -exec rm -rf {} \;
