# frozen_string_literal: true

require_relative 'base_installer'
require_relative '../utils/logging'

# Installer for Cheese.
class CheeseInstaller < BaseInstaller
  def initialize
    super('Cheese')
    @package_name = 'cheese'
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end
end
