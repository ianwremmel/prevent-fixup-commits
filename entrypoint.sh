#!/usr/bin/env bash

set -euo pipefail

# for reasons I can't explain, we still need to `git fetch` even with 
# `fetch-depth: 0`. Perhaps fetch depth only grabs the history of the current 
# SHA and doesn't bother with branch names?
git fetch > /dev/null 2> /dev/null

MERGE_BASE=$(git merge-base HEAD origin/master)
COUNT="$(git log "$MERGE_BASE"..HEAD | grep -c 'fixup!')"
if (( COUNT == 0 )); then 
    echo 'no fixup commits'
    exit 0  
else
    echo "found $COUNT fixup commits. please use 'git rebase --autosquash -i' to remove them"
    exit 1
fi