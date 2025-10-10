# frozen_string_literal: true

require_relative 'utils'

require 'fileutils'

# Config class to link personal configuration files
class ConfigInstaller
  include Logging

  def initialize(from, to)
    @from = from
    @to = to
  end

  def add_symlink
    raise IOError, "config file '#{@from}' does not exists" unless File.exist?(@from)

    logger.info "Adding system link from #{@from} to #{@to}"
    FileUtils.mkdir_p(File.dirname(@to))
    FileUtils.ln_s @from, @to, force: true
  end
end
