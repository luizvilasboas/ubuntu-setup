#!/usr/bin/env bash

set -euo pipefail

echo "Starting setup..."

source scripts/install/install_apts.sh
source scripts/install/install_homebrew.sh
source scripts/install/install_docker.sh
source scripts/install/install_asdf.sh
source scripts/install/install_zed.sh

source scripts/configure/configure_gnome.sh
source scripts/configure/configure_asdf.sh

echo "Removing existing configurations that would conflict with stow..."

rm -f "$HOME/.bashrc"
rm -f "$HOME/.config/starship.toml"
rm -rf "$HOME/.config/zed/settings.json"

echo "Stowing configurations..."
stow bash starship zed

echo "Setup finished. Please restart the computer."
