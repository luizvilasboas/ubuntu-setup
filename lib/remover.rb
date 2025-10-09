# frozen_string_literal: true

require_relative 'utils'

# Generic class for remover.
class Remover
  include Logging

  def initialize(app_name, package_name, manager)
    @app_name = app_name
    @package_name = package_name
    @manager = manager
  end

  # rubocop:disable Metrics/MethodLength
  def remove
    logger.info "Removing #{@app_name} with #{@manager}."
    case @manager
    when :pacman
      run_pacman_remove(@package_name)
    when :yay
      run_yay_remove(@package_name)
    when :flatpak
      run_flatpak_remove(@package_name)
    else
      logger.error "Unsupported package manager: #{@manager}"
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def run_pacman_remove(package)
    command = "sudo pacman -Rns --noconfirm #{package}"
    logger.info command
    # sucess = system(command)
    sucess = true
    raise "Failed when ran '#{command}'." unless sucess

    sucess
  end

  def run_yay_remove(package)
    command = "yay -Rns --noconfirm #{package}"
    logger.info command
    # sucess = system(command)
    sucess = true
    raise "Failed when ran '#{command}'." unless sucess

    sucess
  end

  def run_flatpak_remove(package)
    command = "flatpak uninstall -y --noninteractive #{package}"
    logger.info command
    # sucess = system(command)
    sucess = true
    raise "Failed when ran '#{command}'." unless sucess

    sucess
  end
end
