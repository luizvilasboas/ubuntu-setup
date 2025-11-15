#!/usr/bin/env bash

set -euo pipefail

echo "Installing ASDF..."

if ! command -v asdf &>/dev/null; then
    brew install asdf
    sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libyaml-dev
fi
