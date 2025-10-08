# frozen_string_literal: true

require_relative 'base_installer'
require_relative '../utils/logging'

# Installer for Discord.
class DiscordInstaller < BaseInstaller
  def initialize
    super('Discord')
    @package_name = 'discord'
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end
end
