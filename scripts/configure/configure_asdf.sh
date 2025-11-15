#!/usr/bin/env bash

set -euo pipefail

echo "Configuring ASDF (installing languages)..."

if ! command -v asdf &>/dev/null; then
    echo 'Error: asdf is not installed.' >&2
    exit 1
fi

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git || true
asdf plugin add python https://github.com/asdf-community/asdf-python.git || true
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git || true
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git || true

for lang in ruby python golang nodejs; do
    latest_version=$(asdf latest "$lang")

    if ! asdf list "$lang" | grep -qF "$latest_version"; then
        asdf install "$lang" "$latest_version"
    fi

    asdf global "$lang" "$latest_version"
done
