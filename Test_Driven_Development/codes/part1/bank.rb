# frozen_string_literal: true

require_relative './money'

class Bank # rubocop:disable Style/Documentation
  def reduce(source, to)
    source.reduce(to)
  end
end
