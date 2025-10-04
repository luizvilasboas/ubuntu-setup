# frozen_string_literal: true

module Colors
  COLORS = {
    red:     "\e[31m",
    green:   "\e[32m",
    yellow:  "\e[33m",
    blue:    "\e[34m",
    magenta: "\e[35m",
    cyan:    "\e[36m",
    white:   "\e[37m"
  }

  RESET = "\e[0m"

  COLORS.each do |color_name, color_code|
    define_singleton_method(color_name) do |text|
      "#{color_code}#{text}#{RESET}"
    end
  end
end
