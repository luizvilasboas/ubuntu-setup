# frozen_string_literal: true

require_relative 'utils'

# Generic class for installer.
class Installer
  include Logging

  def initialize(app_name, package_name, manager)
    @app_name = app_name
    @package_name = package_name
    @manager = manager
  end

  # rubocop:disable Metrics/MethodLength
  def install
    logger.info "Installing #{@app_name} with #{@manager}."
    case @manager
    when :pacman
      run_pacman_install(@package_name)
    when :yay
      run_yay_install(@package_name)
    when :flatpak
      run_flatpak_install(@package_name)
    else
      logger.error "Unsupported package manager: #{@manager}"
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def run_pacman_install(package)
    command = "sudo pacman -S --noconfirm #{package}"
    logger.info command
    # sucess = system(command)
    sucess = true
    raise "Failed when ran '#{command}'." unless sucess

    sucess
  end

  def run_yay_install(package)
    command = "yay -S --noconfirm #{package}"
    logger.info command
    # sucess = system(command)
    sucess = true
    raise "Failed when ran '#{command}'." unless sucess

    sucess
  end

  def run_flatpak_install(package)
    command = "flatpak install -y --noninteractive #{package}"
    logger.info command
    # sucess = system(command)
    raise "Failed when ran '#{command}'." unless sucess

    sucess
  end
end
