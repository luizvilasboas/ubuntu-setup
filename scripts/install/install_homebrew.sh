#!/usr/bin/env bash

set -euo pipefail

echo "Installing Homebrew..."

if ! command -v brew &>/dev/null; then
    if ! command -v git &>/dev/null; then
        sudo apt-get install -y git
    fi

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    sudo apt-get install -y build-essential
fi

test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
