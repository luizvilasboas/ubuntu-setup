require_relative 'base_installer'
require_relative '../utils/logging'

class ChromiumInstaller < BaseInstaller
  @@package_name = 'chromium'

  include Logging

  def initialize()
    super('Chromium')
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end
end
