# frozen_string_literal: true

require_relative 'test_case_test'

puts TestCaseTest.new(:test_template_method).run.summary
puts TestCaseTest.new(:test_result).run.summary
puts TestCaseTest.new(:test_failed_result).run.summary
puts TestCaseTest.new(:test_failed_result_formatting).run.summary
