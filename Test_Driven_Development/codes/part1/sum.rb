# frozen_string_literal: true

require_relative './expression'

class Sum # rubocop:disable Style/Documentation
  include Expression

  attr_reader :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(to)
    amount = augend.amount + addend.amount
    Money.new(amount, to)
  end
end
