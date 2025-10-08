# frozen_string_literal: true

require_relative '../install/keepassxc_installer'
require_relative '../install/docker_installer'
require_relative '../install/nvim_installer'
require_relative '../install/chromium_installer'
require_relative '../install/discord_installer'
require_relative '../install/gnome_disk_utility_installer'
require_relative '../install/gparted_installer'
require_relative '../install/localsend_installer'
require_relative '../install/cheese_installer'
require_relative '../install/git_installer'
require_relative '../install/flatpak_installer'
require_relative '../install/lutris_installer'
require_relative '../install/steam_installer'
require_relative '../utils/logging'

# Class to install all apps.
class InstallAllApps
  include Logging

  def run
    if Process.uid != 0
      logger.error 'Must be running this script as root.'
      exit
    end

    apps.each do |app|
      app.new.run
    end
  end

  private

  # rubocop:disable Metrics/MethodLength
  def apps
    [
      KeePassXCInstaller,
      DockerInstaller,
      NvimInstaller,
      ChromiumInstaller,
      DiscordInstaller,
      GnomeDiskUtilityInstaller,
      GpartedInstaller,
      LocalsendInstaller,
      CheeseInstaller,
      GitInstaller,
      FlatpakInstaller,
      LutrisInstaller,
      SteamInstaller
    ]
  end
  # rubocop:enable Metrics/MethodLength
end

InstallAllApps.new.run
