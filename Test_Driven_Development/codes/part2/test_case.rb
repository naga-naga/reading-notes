# frozen_string_literal: true

require_relative 'test_result'

class TestCase
  def initialize(name)
    @name = name
  end

  def setup; end

  def tear_down; end

  def run(result)
    result.test_started
    setup

    begin
      send(@name)
    rescue StandardError
      result.test_failed
    end

    tear_down
  end
end
