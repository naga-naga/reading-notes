def to_hex(r, g, b)
  [r, g, b].sum('#') do |color|
    color.to_s(16).rjust(2, '0').upcase
  end
end

def to_ints(hex_stirng)
  hex_stirng.upcase.scan(/[0-9A-F]{2}/).map(&:hex)

  # r = hex_stirng[1..2]
  # g = hex_stirng[3..4]
  # b = hex_stirng[5..6]

  # [r, g, b].map(&:hex)
end
