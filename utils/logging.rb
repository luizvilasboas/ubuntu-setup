# frozen_string_literal: true

require 'logger'
require_relative 'colors'

# Module to provide a logger.
module Logging
  SEVERITY_COLORS = {
    'DEBUG' => :cyan,
    'INFO' => :green,
    'WARN' => :yellow,
    'ERROR' => :red,
    'FATAL' => :magenta,
    'UNKNOWN' => :white
  }.freeze

  # rubocop:disable Metrics/MethodLength
  def logger
    @logger ||= begin
      logger_instance = Logger.new($stdout)
      logger_instance.level = Logger::INFO
      logger_instance.formatter = proc do |severity, msg|
        color_symbol = SEVERITY_COLORS.fetch(severity, :white)
        severity_text = severity.to_s
        colorized_severity = Colors.public_send(color_symbol, severity_text)
        "[#{colorized_severity}] [#{self.class.name}]> #{msg}\n"
      end
      logger_instance
    end
  end
  # rubocop:enable Metrics/MethodLength
end
