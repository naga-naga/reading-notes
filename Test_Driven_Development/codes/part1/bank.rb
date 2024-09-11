# frozen_string_literal: true

require_relative './money'
require_relative './pair'

class Bank
  def initialize
    @rates = {}
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def add_rate(from, to, rate)
    @rates[Pair.new(from, to)] = rate
  end

  def rate(from, to)
    return 1 if from == to

    @rates[Pair.new(from, to)]
  end
end
