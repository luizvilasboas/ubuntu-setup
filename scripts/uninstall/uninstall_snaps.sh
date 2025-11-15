#!/usr/bin/env bash

set -euo pipefail

echo "Removing Snaps..."

if ! command -v snap &>/dev/null; then
    exit 0
fi

sudo snap remove firefox || true
