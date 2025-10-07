require_relative 'base_installer'
require_relative '../utils/logging'

class CheeseInstaller < BaseInstaller
  @@package_name = 'cheese'

  include Logging

  def initialize()
    super('Cheese')
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end
end
