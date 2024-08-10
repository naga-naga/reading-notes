# frozen_string_literal: true

require 'date'

# パターンマッチ
records = [
  [2024],
  [2024, 5],
  [2024, 8, 23]
]

date = records.map do |record|
  case record
  in [year]
    Date.new(year, 1, 1).to_s
  in [year, month]
    Date.new(year, month, 1).to_s
  in [year, month, day]
    Date.new(year, month, day).to_s
  end
end

p date
puts '---'

# ハッシュに対するパターンマッチ
cars = [
  { name: 'The Beatle', engine: '105ps' },
  { name: 'Prius', engine: '98ps', motor: '72ps' },
  { name: 'Tesla', motor: '306ps' }
]

cars.each do |car|
  case car
  in { name:, engine:, motor: }
    puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
  in { name:, engine: }
    puts "Gasoline: #{name} / engine: #{engine}"
  in { name:, motor: }
    puts "EV: #{name} / motor: #{motor}"
  end
end

puts '---'

# ピン演算子
alice = 'Alice'
name = 'Alice'

case name
in ^alice
  puts 'Alice!'
else
  puts 'other'
end

# s = '1'
# case 1
# in ^(s.to_i)
#   puts '1です'
# else
#   puts '1ではないです'
# end

puts '---'

# 自作クラスをパターンマッチに対応させる
class Point
  def initialize(x, y)
    @x = x
    @y = y
  end

  def deconstruct
    [@x, @y]
  end

  def deconstruct_keys(_keys)
    { x: @x, y: @y }
  end

  def to_s
    "x: #{@x}, y: #{@y}"
  end
end

point = Point.new(10, 20)

case point
in [1, 2]
  puts '1, 2'
in [10, 20]
  puts '10, 20'
else
  puts 'nil'
end

case point
in x: 1, y: 2
  puts 'x: 1, y: 2'
in x: 10, y: 20
  puts 'x: 10, y: 20'
else
  puts 'nil'
end

data = [
  point,
  [10, 20]
]

data.each do |d|
  case d
  in Array(10, 20)
    puts 'array 10, 20'
  in Point(10, 20)
    puts 'point 10, 20'
  else
    puts 'nil'
  end
end
