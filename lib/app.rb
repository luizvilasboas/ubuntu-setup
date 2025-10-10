# frozen_string_literal: true

# Abstract class for any app managing class
class App
  def initialize(app_name, package_name, manager)
    @app_name = app_name
    @package_name = package_name
    @manager = manager
  end
end
