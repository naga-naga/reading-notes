# frozen_string_literal: true

require_relative 'test_case'
require_relative 'was_run'

class TestCaseTest < TestCase
  def test_running
    test = WasRun.new(:test_method)
    raise if test.was_run

    test.run
    raise unless test.was_run

    puts 'success'
  end
end

TestCaseTest.new(:test_running).run
