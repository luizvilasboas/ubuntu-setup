require_relative '../utils/logging'

class BaseInstaller
  attr_reader :app_name

  include Logging

  def initialize(app_name)
    @app_name = app_name
    raise ArgumentError, 'Must provide an app name.' if app_name.nil? || app_name.empty?
  end

  def run
    logger.info "Starting the install of #{@app_name}."
    pre_install
    install
    post_install
    logger.info "#{@app_name} installed sucessfuly."
  rescue NotImplementedError => e
    logger.error 'Must implement all methods.'
  rescue => e
    logger.error "An undefined error happend. Message: #{e}"
  end

  protected
  def pre_install
  end

  def install
    raise NotImplementedError, "#{self.class} did not implemented the 'install' method"
  end

  def post_install
  end

  def run_apt_install(package)
    # TODO Study if there is a shorter output for APT (like a -q flag or something)
    command = "sudo apt install -y #{package}"
    logger.info "Executing: sudo apt install -y #{package}"
    sucess = system(command)
    raise "Failed when ran '#{command}'." unless sucess
    sucess
  end
end
