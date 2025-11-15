#!/usr/bin/env bash

set -euo pipefail

echo "Configuring GNOME environment..."

if ! command -v gsettings &>/dev/null; then
    echo "Error: gsettings command not found. Cannot configure GNOME." >&2
    exit 1
fi

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
