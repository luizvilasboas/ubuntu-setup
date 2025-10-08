# frozen_string_literal: true

require_relative 'base_installer'
require_relative '../utils/logging'

# Installer for Neovim.
class NvimInstaller < BaseInstaller
  def initialize
    super('Neovim')
    @package_name = 'neovim'
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end

  # rubocop:disable Metrics/MethodLength
  def post_install
    user = ENV.fetch('SUDO_USER', nil)
    home = Dir.home(user)

    backup_old_config(user, home)

    logger.info 'Cloning LazyVim starter repository.'
    clone_command = "sudo -u #{user} git clone https://github.com/LazyVim/starter #{home}/.config/nvim"
    if system(clone_command)
      logger.info 'Removing .git folder from LazyVim repository.'
      rm_command = "sudo -u #{user} rm -rf #{home}/.config/nvim/.git"
      if system(rm_command)
        logger.info 'LazyVim installed successfully. Start nvim to complete the installation.'
      else
        logger.error 'Failed to remove .git folder.'
      end
    else
      logger.error 'Failed to clone LazyVim repository.'
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def backup_old_config(user, home)
    logger.info "Backing up existing Neovim configuration for user #{user}."
    system("sudo -u #{user} mv #{home}/.config/nvim{,.bak}")
    system("sudo -u #{user} mv #{home}/.local/share/nvim{,.bak}")
    system("sudo -u #{user} mv #{home}/.local/state/nvim{,.bak}")
    system("sudo -u #{user} mv #{home}/.cache/nvim{,.bak}")
  end
end
