# frozen_string_literal: true

require_relative './expression'
require_relative './sum'

class Money
  include Expression

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
    Sum.new(self, addend)
  end

  def times(multiplier)
    Money.new(amount * multiplier, currency)
  end

  def reduce(_to)
    self
  end

  def ==(other)
    return false unless other.is_a?(Money)

    amount == other.amount && currency == other.currency
  end

  def to_s
    "#{@amount} #{@currency}"
  end
end
