require_relative 'base_installer'
require_relative '../utils/logging'

class GitInstaller < BaseInstaller
  @@package_name = 'git'

  include Logging

  def initialize()
    super('Git')
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end

  def post_install
    user = ENV['SUDO_USER']
    # TODO: Replace with your git username and email
    git_user_name = "Your Name"
    git_user_email = "youremail@example.com"

    logger.info "Configuring git for user #{user}."
    system("sudo -u #{user} git config --global user.name \"#{git_user_name}\"")
    system("sudo -u #{user} git config --global user.email \"#{git_user_email}\"")
    logger.info "Git configured with username '#{git_user_name}' and email '#{git_user_email}'."
  end
end
