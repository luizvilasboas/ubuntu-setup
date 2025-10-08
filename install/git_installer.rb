# frozen_string_literal: true

require_relative 'base_installer'
require_relative '../utils/logging'

# Installer for Git.
class GitInstaller < BaseInstaller
  def initialize
    super('Git')
    @package_name = 'git'
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end

  def post_install
    user = ENV.fetch('SUDO_USER', nil)

    logger.info 'Please enter your git username:'
    git_user_name = gets.chomp

    logger.info 'Please enter your git email:'
    git_user_email = gets.chomp

    logger.info "Configuring git for user #{user}."
    system("sudo -u #{user} git config --global user.name \"#{git_user_name}\"")
    system("sudo -u #{user} git config --global user.email \"#{git_user_email}\"")
    logger.info "Git configured with username '#{git_user_name}' and email '#{git_user_email}'."
  end
end
