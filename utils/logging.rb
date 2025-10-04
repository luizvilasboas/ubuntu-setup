require 'logger'

# TODO Add colors depending on the severity
module Logging
  def logger
    @logger ||= begin
      logger_instance = Logger.new(STDOUT)
      logger_instance.level = Logger::INFO
      logger_instance.formatter = proc do |severity, datetime, progname, msg|
        "[#{severity}] [#{self.class.name}]> #{msg}\n"
      end
      logger_instance
    end
  end
end
