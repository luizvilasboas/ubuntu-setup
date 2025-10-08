# frozen_string_literal: true

require_relative 'base_installer'
require_relative '../utils/logging'

# Installer for Localsend.
class LocalsendInstaller < BaseInstaller
  def initialize
    super('Localsend')
    @package_name = 'localsend-bin'
  end

  def install
    logger.info "Installing #{@app_name} with yay."
    run_yay_install(@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end
end
