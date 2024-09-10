# frozen_string_literal: true

require_relative './money'

class Franc < Money # rubocop:disable Style/Documentation
  def times(multiplier)
    Money.franc(@amount * multiplier)
  end
end
