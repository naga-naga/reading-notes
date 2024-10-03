# frozen_string_literal: true

class TestCase
  def initialize(name)
    @name = name
  end

  def setup; end

  def run
    setup
    send(@name)
  end
end
