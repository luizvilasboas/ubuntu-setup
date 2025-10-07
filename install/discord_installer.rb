require_relative 'base_installer'
require_relative '../utils/logging'

class DiscordInstaller < BaseInstaller
  @@package_name = 'discord'

  include Logging

  def initialize()
    super('Discord')
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end
end
