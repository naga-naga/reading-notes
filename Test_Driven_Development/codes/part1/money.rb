# frozen_string_literal: true

class Dollar # rubocop:disable Style/Documentation
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end

  def ==(other)
    @amount == Dollar.new(other).amount
  end
end
