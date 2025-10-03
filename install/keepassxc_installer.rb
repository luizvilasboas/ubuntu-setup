require_relative 'base_installer'

class KeePassXCInstaller < BaseInstaller
  @@path_to_keepassxc_database = '~/.local/share/keepassxc'
  @@package_name = 'keepassxc'

  def initialize()
    super('KeePassXC')
  end

  def pre_install
    puts "[PRE_INSTALL]> Creating an folder to put the #{@app_name} database file (default #{@@path_to_keepassxc_database})."
    command = "mkdir -p #{@@path_to_keepassxc_database}"
    sucess = system(command)

    if sucess
      puts "[PRE_INSTALL]> Created #{@app_name} database folder in #{@@path_to_keepassxc_database}."
    else
      puts "[PRE_INSTALL]> Couldn't create folder at #{@@path_to_keepassxc_database}."
    end
  end

  def install
    puts "[INSTALL]> Installing #{@app_name} with APT."
    sucess = run_apt_install(@@package_name)
    if sucess
      puts "[INSTALL]> Installed #{@app_name} sucessfuly."
    else
      puts "[INSTALL]> Could not install #{@app_name}. Status code: #{sucess}."
    end
  end
end
