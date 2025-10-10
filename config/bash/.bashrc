source ~/.local/share/omarchy/default/bash/rc

. "$HOME/.local/share/../bin/env"

set -h

export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"

if [ -z "$SSH_AUTH_SOCK" ]; then
  eval `ssh-agent -s` &> /dev/null
  ssh-add ~/.ssh/desktop &> /dev/null
fi

if [ ! -z "$HOME/.local/share/keepassxc" ]; then
  mkdir ~/.local/share/keepassxc
fi
