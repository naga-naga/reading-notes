# frozen_string_literal: true

class Money # rubocop:disable Style/Documentation
  attr_reader :amount, :currency

  def self.dollar(amount)
    Dollar.new(amount, 'USD')
  end

  def self.franc(amount)
    Franc.new(amount, 'CHF')
  end

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    Money.new(@amount * multiplier, currency)
  end

  def ==(other)
    return false unless other.is_a?(Money)

    amount == other.amount && currency == other.currency
  end

  def to_s
    "#{@amount} #{@currency}"
  end
end
