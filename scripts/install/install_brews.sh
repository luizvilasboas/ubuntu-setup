#!/usr/bin/env bash

echo "Installing brew packages (gemini-cli, lazydocker, etc)."

if ! whereis gemini &>/dev/null; then
    brew install gemini-cli
fi
