# frozen_string_literal: true

require_relative 'test_case'
require_relative 'test_result'
require_relative 'was_run'

class TestCaseTest < TestCase
  def setup
    @result = TestResult.new
  end

  def test_template_method
    test = WasRun.new(:test_method)
    test.run(@result)
    raise unless test.log == 'setup test_method tear_down '
  end

  def test_result
    test = WasRun.new(:test_method)
    test.run(@result)
    raise unless @result.summary == '1 run, 0 failed'
  end

  def test_failed_result
    test = WasRun.new(:test_broken_method)
    test.run(@result)
    raise unless @result.summary == '1 run, 1 failed'
  end

  def test_failed_result_formatting
    @result.test_started
    @result.test_failed
    raise unless @result.summary == '1 run, 1 failed'
  end

  def test_suite
    suite = TestSuite.new
    suite.add(WasRun.new(:test_method))
    suite.add(WasRun.new(:test_broken_method))
    suite.run(@result)
    raise unless @result.summary == '2 run, 1 failed'
  end
end
