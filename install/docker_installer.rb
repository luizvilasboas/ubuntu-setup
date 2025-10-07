require_relative 'base_installer'
require_relative '../utils/logging'

class DockerInstaller < BaseInstaller
  @@package_name = 'docker docker-compose lazydocker'

  include Logging

  def initialize()
    super('Docker')
  end

  def install
    logger.info "Installing #{@app_name} with pacman."
    run_pacman_install(@@package_name)
    logger.info "Installed #{@app_name} sucessfuly."
  end

  def post_install
    user = ENV['SUDO_USER']
    logger.info "Adding user #{user} to the docker group."
    command = "usermod -aG docker #{user}"
    sucess = system(command)

    if sucess
      logger.info "User #{user} added to the docker group."
      logger.warn 'You need to log out and log in again for the changes to take effect.'
    else
      logger.error "Couldn't add user to the docker group."
    end
  end
end
