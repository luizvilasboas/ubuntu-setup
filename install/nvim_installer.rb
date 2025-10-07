require_relative 'base_installer'
require_relative '../utils/logging'

class NvimInstaller < BaseInstaller
  @@package_name = 'neovim'

  include Logging

  def initialize()
    super('Neovim')
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end

  def post_install
    user = ENV['SUDO_USER']
    home = Dir.home(user)

    logger.info "Backing up existing Neovim configuration for user #{user}."
    system("sudo -u #{user} mv #{home}/.config/nvim{,.bak}")
    system("sudo -u #{user} mv #{home}/.local/share/nvim{,.bak}")
    system("sudo -u #{user} mv #{home}/.local/state/nvim{,.bak}")
    system("sudo -u #{user} mv #{home}/.cache/nvim{,.bak}")

    logger.info "Cloning LazyVim starter repository."
    clone_command = "sudo -u #{user} git clone https://github.com/LazyVim/starter #{home}/.config/nvim"
    if system(clone_command)
        logger.info "Removing .git folder from LazyVim repository."
        rm_command = "sudo -u #{user} rm -rf #{home}/.config/nvim/.git"
        if system(rm_command)
            logger.info "LazyVim installed successfully. Start nvim to complete the installation."
        else
            logger.error "Failed to remove .git folder."
        end
    else
        logger.error "Failed to clone LazyVim repository."
    end
  end
end
