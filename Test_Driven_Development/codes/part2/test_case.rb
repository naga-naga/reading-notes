# frozen_string_literal: true

require_relative 'test_result'

class TestCase
  def initialize(name)
    @name = name
  end

  def setup; end

  def tear_down; end

  def run
    result = TestResult.new
    result.test_started
    setup
    send(@name)
    tear_down
    result
  end
end
