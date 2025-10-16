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

  def add_symlink # rubocop:disable Metrics/MethodLength
    raise IOError, "config file '#{@from}' does not exists" unless File.exist?(@from)

    logger.info "Adding system link from #{@from} to #{@to}"

    if File.directory? @from
      pattern = File.join(@from, '*')

      Dir.glob(pattern).each do |filepath|
        FileUtils.mkdir_p(File.dirname(@to))
        FileUtils.ln_s(filepath, @to, force: true)
      end
    else
      FileUtils.mkdir_p(File.dirname(@to))
      FileUtils.ln_s(@from, @to, force: true)
    end
  end
end
