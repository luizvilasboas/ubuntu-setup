# frozen_string_literal: true

require_relative 'base_installer'
require_relative '../utils/logging'

# Installer for Gparted.
class GpartedInstaller < BaseInstaller
  def initialize
    super('Gparted')
    @package_name = 'gparted'
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end
end
