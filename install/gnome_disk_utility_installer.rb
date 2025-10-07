require_relative 'base_installer'
require_relative '../utils/logging'

class GnomeDiskUtilityInstaller < BaseInstaller
  @@package_name = 'gnome-disk-utility'

  include Logging

  def initialize()
    super('Gnome Disk Utility')
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end
end
