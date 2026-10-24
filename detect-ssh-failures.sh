#!/usr/bin/env bash

set -u

echo "=== SSH Failed Authentication Detection ==="

LOGS=$(sudo journalctl -u ssh --since "24 hours ago" --no-pager)

if [[ -z "$LOGS" ]]; then
    echo "No SSH journal entries found in the selected period."
    exit 0
fi

echo "$LOGS" \
    | grep -E 'Failed password' \
    | grep -oE 'from ([0-9]{1,3}\.){3}[0-9]{1,3}' \
    | sort \
    | uniq -c \
    | sort -nr

echo
echo "=== Investigation complete ==="
