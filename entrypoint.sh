#!/usr/bin/env bash

set -euo pipefail

git config --global --add safe.directory '*'

# for reasons I can't explain, we still need to `git fetch` even with 
# `fetch-depth: 0`. Perhaps fetch depth only grabs the history of the current 
# SHA and doesn't bother with branch names?
echo 'Fetching full repository from GitHub'
git fetch > /dev/null 2> /dev/null
echo 'Fetched full repository from GitHub.'

echo 'Computing merge base'
MERGE_BASE=$(git merge-base HEAD origin/master)
echo "Found merge base $MERGE_BASE."

if [ "$MERGE_BASE" == "$GITHUB_SHA" ]; then
  echo "MERGE_BASE and GITHUB_SHA match. Exiting 0 as there are no commits to check."
  exit 0
fi

echo 'Counting fixup! commits.'
set +e
COUNT="$(git log "$MERGE_BASE"..HEAD | grep -c 'fixup!')"
set -e
echo "Found $COUNT fixup! commits."

if (( COUNT == 0 )); then 
    echo 'Did not find any fixup! commits. Exiting cleanly.'
    exit 0
else
    echo 'Found fixup! commits. Failing workflow.'
    echo 'Please use interactive rebase with --autosquach to squash commits.'
    exit 1
fi