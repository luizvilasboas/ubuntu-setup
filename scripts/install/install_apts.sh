#!/usr/bin/env bash

set -euo pipefail

echo "Installing APT packages..."

packages_list=(
    shellcheck
    shfmt
    gnome-shell-extension-manager
    neofetch
    git
    keepassxc
    menulibre
    libreoffice
    git-lfs
    chromium-browser
    filezilla
    stow
)

sudo apt-get update
sudo apt-get install -y "${packages_list[@]}"
