# frozen_string_literal: true

require_relative 'base_installer'
require_relative '../utils/logging'

# Installer for Lutris.
class LutrisInstaller < BaseInstaller
  def initialize
    super('Lutris')
    @package_name = 'net.lutris.Lutris'
  end

  def install
    logger.info "Installing #{@app_name} with Flatpak."
    run_flatpak_install(@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end
end
