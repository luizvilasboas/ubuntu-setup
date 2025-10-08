# frozen_string_literal: true

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
