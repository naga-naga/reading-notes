# frozen_string_literal: true

require_relative 'test_case'
require_relative 'test_result'
require_relative 'was_run'

class TestCaseTest < TestCase
  def test_template_method
    test = WasRun.new(:test_method)
    test.run
    raise unless test.log == 'setup test_method tear_down '
  end

  def test_result
    test = WasRun.new(:test_method)
    result = test.run
    raise unless result.summary == '1 run, 0 failed'
  end

  def test_failed_result
    test = WasRun.new(:test_broken_method)
    result = test.run
    raise unless result.summary == '1 run, 1 failed'
  end

  def test_failed_result_formatting
    result = TestResult.new
    result.test_started
    result.test_failed
    raise unless result.summary == '1 run, 1 failed'
  end
end

TestCaseTest.new(:test_template_method).run
TestCaseTest.new(:test_result).run
TestCaseTest.new(:test_failed_result).run
TestCaseTest.new(:test_failed_result_formatting).run
