# frozen_string_literal: true

class TestCase
  def initialize(name)
    @name = name
  end

  def setup; end

  def tear_down; end

  def run
    setup
    send(@name)
    tear_down
  end
end
