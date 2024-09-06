# frozen_string_literal: true

class Franc # rubocop:disable Style/Documentation
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Franc.new(@amount * multiplier)
  end

  def ==(other)
    @amount == Franc.new(other).amount
  end
end
