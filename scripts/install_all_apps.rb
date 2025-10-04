require_relative '../install/keepassxc_installer'
require_relative '../utils/logging'

include Logging

if Process.uid != 0
  logger.error 'Must be running this script as root.'
  exit
end

# TODO Packages to install and configure in my distro:
# - docker, docker compose and lazydocker
# - nvim and lazyvim
# - chromium
# - discord
# - gnome-disk-utility
# - gparted
# - gparted
# - localsend
# - tibia
# - cheese
# - git

apps = [
  KeePassXCInstaller
]

for app in apps
  app.new.run
end
