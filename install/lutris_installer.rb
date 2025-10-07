require_relative 'base_installer'
require_relative '../utils/logging'

class LutrisInstaller < BaseInstaller
  @@package_name = 'net.lutris.Lutris'

  include Logging

  def initialize()
    super('Lutris')
  end

  def install
    logger.info "Installing #{@app_name} with Flatpak."
    run_flatpak_install(@@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end
end
