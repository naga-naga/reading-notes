# frozen_string_literal: true

class Money # rubocop:disable Style/Documentation
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def ==(other)
    return false unless other.is_a?(Money)

    @amount == other.amount && self.class == other.class
  end
end
