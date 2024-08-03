module Rainbowable
  def rainbow
    colored_chars = []

    to_s.each_char.map.with_index do |char, count|
      color = (count % 6) + 31
      colored_chars << "\e[#{color}m#{char}"
      # "\e[#{color}m#{char}"
    end
    #.join + "\e[0m"

    "#{colored_chars.join}\e[0m"
  end
end
