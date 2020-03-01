#!/usr/bin/env bash

# ============================================================================
# This script was used to download the original website for reworking.
# https://simpleit.rocks/linux/how-to-download-a-website-with-wget-the-right-way/
# Contents of `/diybookscanner.org/archivist` were moved to `/rip`.
# To reduce repo size, they were added to `.gitignore`.
# ============================================================================

wget --wait=1 \
     --level=inf \
     --recursive \
     --page-requisites \
     --user-agent=Mozilla \
     --no-parent \
     --convert-links \
     --restrict-file-names=windows \
     --no-clobber \
     -e robots=off \
     --domains diybookscanner.org \
     https://diybookscanner.org/archivist/
