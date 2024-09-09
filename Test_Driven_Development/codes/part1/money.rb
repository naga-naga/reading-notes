# frozen_string_literal: true

class Money # rubocop:disable Style/Documentation
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def ==(other)
    @amount == Money.new(other).amount
  end
end
