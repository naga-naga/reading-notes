# frozen_string_literal: true

require_relative 'test_case'

class WasRun < TestCase
  attr_reader :log

  def setup
    @log = 'setup '
  end

  def test_method
    @log += 'test_method '
  end

  def test_broken_method
    raise
  end

  def tear_down
    @log += 'tear_down '
  end
end
