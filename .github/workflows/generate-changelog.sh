#!/bin/bash

# Get the previous tag.
PREVIOUS_TAG="$1"

# Get the current commit hash.
CURRENT_COMMIT="$2"

# Generate the changelog.
git log --no-merges --format='format: - %s%n' "${PREVIOUS_TAG}..${CURRENT_COMMIT}" > CHANGELOG.md

# Add a header to the changelog.
echo "# Changelog" >> CHANGELOG.md

# Sort the changelog entries by date.
sort -r CHANGELOG.md > CHANGELOG.md.tmp
mv CHANGELOG.md.tmp CHANGELOG.md