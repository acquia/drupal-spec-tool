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
orca fixture:init -f --sut=acquia/drupal-spec-tool --profile=lightning

cd "$ORCA_FIXTURE_DIR" || exit 1

# Remove conflicting package and add Behat.
composer remove --dev acquia/blt-require-dev
composer require behat/behat
