# frozen_string_literal: true

require_relative 'utils'
require_relative 'app'

# Generic class for remover.
class AppRemover < App
  include Logging

  # rubocop:disable Metrics/MethodLength
  def exec
    logger.info "Removing #{@app_name} with #{@package_manager}."
    case @package_manager
    when 'pacman'
      run_pacman_remove(@package_name)
    when 'yay'
      run_yay_remove(@package_name)
    when 'flatpak'
      run_flatpak_remove(@package_name)
    else
      logger.error "Unsupported package manager: #{@package_manager}"
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def run_pacman_remove(package)
    command = "sudo pacman -Rns --noconfirm #{package}"
    logger.info command
    sucess = system(command)
    raise "Failed when ran '#{command}'." unless sucess

    sucess
  end

  def run_yay_remove(package)
    command = "yay -Rns --noconfirm #{package}"
    logger.info command
    sucess = system(command)
    raise "Failed when ran '#{command}'." unless sucess

    sucess
  end

  def run_flatpak_remove(package)
    command = "flatpak uninstall -y --noninteractive #{package}"
    logger.info command
    sucess = system(command)
    raise "Failed when ran '#{command}'." unless sucess

    sucess
  end
end
