#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root. Please use sudo." >&2
  exit 1
fi

if ! command -v git &> /dev/null
then
    echo "Git could not be found, please install it first."
    exit
fi

if ! command -v ruby &> /dev/null
then
    echo "Ruby could not be found, please install it first."
    exit
fi

INSTALL_DIR="$HOME/.local/share/omarchy_post_install"

echo "Cloning the repository to $INSTALL_DIR..."
git clone https://github.com/luizvilasboas/omarchy_post_install.git "$INSTALL_DIR"

cd "$INSTALL_DIR"

echo "Installing dependencies..."
bundle install

echo "Running the application..."
./bin/omarchy_post_install

