#!/usr/bin/env bash

set -euo pipefail

# for reasons I can't explain, we still need to `git fetch` even with 
# `fetch-depth: 0`. Perhaps fetch depth only grabs the history of the current 
# SHA and doesn't bother with branch names?
echo 'Fetching full repository from GitHub'
git fetch > /dev/null 2> /dev/null
echo 'Fetched full repository from GitHub'

echo 'Computing merge base'
MERGE_BASE=$(git merge-base HEAD origin/master)
echo "Found merge base $MERGE_BASE"

echo 'Counting fixup! commits'
COUNT="$(git log "$MERGE_BASE"..HEAD | grep -c 'fixup!')"
echo "Found $COUNT fixup! commits"

if (( COUNT == 0 )); then 
    echo 'Did not find any fixup! commits. Exiting cleanly'
    exit 0
else
    echo 'Found fixup! commits. Failing workflow.'
    echo 'Please use interactive rebase with --autosquach to squash commits'
    exit 1
fi