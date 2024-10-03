# frozen_string_literal: true

require_relative 'test_case'

class WasRun < TestCase
  attr_reader :was_setup, :was_run

  def setup
    @was_run = nil
    @was_setup = 1
  end

  def test_method
    @was_run = 1
  end
end
