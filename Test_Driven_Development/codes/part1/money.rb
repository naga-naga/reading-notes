# frozen_string_literal: true

class Dollar # rubocop:disable Style/Documentation
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    @amount *= multiplier
  end
end