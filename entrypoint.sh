#!/usr/bin/env bash

set -euo pipefail

if [ "$(git log "$(git merge-base HEAD origin/master)"..HEAD | grep -c 'fixup!')" -eq 0 ]; then 
    echo 'no fixup commits'
    exit 0  
else
    echo 'found fixup commits. please use "git rebase --autosquash -i" to remove them'
    exit 1
fi