class BaseInstaller
  # TODO Add a logging system for these messages
  attr_reader :app_name

  def initialize(app_name)
    @app_name = app_name
    raise ArgumentError, '[ERROR]> Must provide an app name.' if app_name.nil? || app_name.empty?
  end

  def run
    puts "[RUN]> Starting the install of #{@app_name}."
    pre_install
    install
    post_install
    puts "[RUN]> #{@app_name} installed sucessfuly."
  rescue NotImplementedError => e
    puts '[ERROR]> Must implement all methods.'
  rescue => e
    puts "[ERROR]> An undefined error happend. Message: #{e}"
  end

  protected
  def pre_install
  end

  def install
    raise NotImplementedError, "[ERROR]> #{self.class} did not implemented the 'install' method"
  end

  def post_install
  end

  def run_apt_install(package)
    # TODO Study if there is a shorter output for APT (like a -q flag or something)
    command = "sudo apt install -y #{package}"
    puts "[INSTALL]> Executing: sudo apt install -y #{package}"
    sucess = system(command)
    raise "[ERROR]> Failed when ran '#{command}'." unless sucess
    sucess
  end
end
