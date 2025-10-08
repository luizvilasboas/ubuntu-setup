# frozen_string_literal: true

require_relative 'base_installer'
require_relative '../utils/logging'

# Installer for Flatpak.
class FlatpakInstaller < BaseInstaller
  def initialize
    super('Flatpak')
    @package_name = 'flatpak'
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end

  def post_install
    logger.info 'Adding Flathub remote.'
    command = 'flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo'
    if system(command)
      logger.info 'Flathub remote added successfully.'
    else
      logger.error 'Failed to add Flathub remote.'
    end
  end
end
