require_relative 'base_installer'
require_relative '../utils/logging'

class LocalsendInstaller < BaseInstaller
  @@package_name = 'localsend-bin'

  include Logging

  def initialize()
    super('Localsend')
  end

  def install
    logger.info "Installing #{@app_name} with yay."
    run_yay_install(@@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end
end
