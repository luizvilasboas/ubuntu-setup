# frozen_string_literal: true

require 'logger'

# Module to colorize the output.
module Colors
  COLORS = {
    red: "\e[31m",
    green: "\e[32m",
    yellow: "\e[33m",
    blue: "\e[34m",
    magenta: "\e[35m",
    cyan: "\e[36m",
    white: "\e[37m"
  }.freeze

  RESET = "\e[0m"

  COLORS.each do |color_name, color_code|
    define_singleton_method(color_name) do |text|
      "#{color_code}#{text}#{RESET}"
    end
  end
end

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
      logger_instance.formatter = proc do |severity, _datetime, _progname, msg|
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
