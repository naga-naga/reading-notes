module Loggable
  private

  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  include Loggable

  def title
    log('title is called')
    'A great movie'
  end
end

class User
  include Loggable

  def name
    log('name is called')
    'Alice'
  end
end

Product.new.title
User.new.name

# ---

class Product2
  extend Loggable

  def self.title
    log('title is called')
    'A great movie'
  end
end

class User2
  extend Loggable

  def self.name
    log('name is called')
    'Alice'
  end
end

Product2.title
User2.name

# ---

class Tempo
  include Comparable

  attr_reader :bpm

  def initialize(bpm:)
    @bpm = bpm
  end

  def <=>(other)
    other.is_a?(Tempo) ? bpm <=> other.bpm : nil
  end

  def inspect
    "#{bpm} BPM"
  end

  def to_s
    "#{bpm} BPM"
  end
end

tempo120 = Tempo.new(bpm: 120)
tempo180 = Tempo.new(bpm: 180)

puts tempo120 > tempo180
puts tempo120 <= tempo180
puts tempo120 == tempo180

tempos = [Tempo.new(bpm: 180), Tempo.new(bpm: 60), Tempo.new(bpm: 240), Tempo.new(bpm: 120)]
tempos.sort
p tempos

# ---

module BaseBall
  class Second
    def initialize(player, uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end
end

module Clock
  class Second
    def initialize(digits)
      @digits = digits
    end
  end
end

p BaseBall::Second.new('Alice', 15)
p Clock::Second.new(40)

# ---

module PrependA
  def to_s
    "<PrependA> #{super}"
  end
end

class PrependProduct
  prepend PrependA

  def to_s
    "<PrependProduct> #{super}"
  end
end

puts PrependProduct.new

# ---

module StringShuffle
  refine String do
    def shuffle
      chars.shuffle.join
    end
  end
end

class RefinementUser
  using StringShuffle

  def initialize(name)
    @name = name
  end

  def shuffle_name
    @name.shuffle
  end
end

puts RefinementUser.new('John Smith').shuffle_name
