# frozen_string_literal: true

require_relative 'test_case_test'
require_relative 'test_result'
require_relative 'test_suite'

# puts TestCaseTest.new(:test_template_method).run.summary
# puts TestCaseTest.new(:test_result).run.summary
# puts TestCaseTest.new(:test_failed_result).run.summary
# puts TestCaseTest.new(:test_failed_result_formatting).run.summary
# puts TestCaseTest.new(:test_suite).run.summary

suite = TestSuite.new
suite.add(TestCaseTest.new(:test_template_method))
suite.add(TestCaseTest.new(:test_result))
suite.add(TestCaseTest.new(:test_failed_result))
suite.add(TestCaseTest.new(:test_failed_result_formatting))
suite.add(TestCaseTest.new(:test_suite))

result = TestResult.new
suite.run(result)
puts result.summary
