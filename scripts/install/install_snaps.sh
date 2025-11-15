#!/usr/bin/env bash

set -euo pipefail

echo "Installing Snap packages..."

packages_list=(
    localsend
    insomnia
    beekeeper-studio
)

sudo snap refresh
sudo snap install "${packages_list[@]}"
