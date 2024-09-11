# frozen_string_literal: true

class Pair
  def initialize(from, to)
    @from = from
    @to = to
  end

  def eql?(other)
    from == other.from && to == other.to
  end

  def hash
    {
      from: @from,
      to: @to
    }.hash
  end

  protected

  attr_reader :from, :to
end
