#!/usr/bin/env bash

set -euo pipefail

echo "Installing Zed editor..."

if command -v zed &>/dev/null; then
    exit 0
fi

if ! command -v curl &>/dev/null; then
    echo "Error: curl is not installed. Cannot install Zed." >&2
    exit 1
fi

curl -f https://zed.dev/install.sh | sh
