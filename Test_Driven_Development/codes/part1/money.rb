# frozen_string_literal: true

class Money # rubocop:disable Style/Documentation
  attr_reader :amount, :currency

  def self.dollar(amount)
    Money.new(amount, 'USD')
  end

  def self.franc(amount)
    Money.new(amount, 'CHF')
  end

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def plus(addend)
    Money.new(amount + addend.amount, currency)
  end

  def times(multiplier)
    Money.new(amount * multiplier, currency)
  end

  def ==(other)
    return false unless other.is_a?(Money)

    amount == other.amount && currency == other.currency
  end

  def to_s
    "#{@amount} #{@currency}"
  end
end
