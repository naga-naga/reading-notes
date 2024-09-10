# frozen_string_literal: true

class Money # rubocop:disable Style/Documentation
  attr_reader :amount

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount)
  end

  def initialize(amount)
    @amount = amount
  end

  def ==(other)
    return false unless other.is_a?(Money)

    @amount == other.amount && self.class == other.class
  end
end
