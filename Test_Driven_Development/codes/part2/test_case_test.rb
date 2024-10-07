# frozen_string_literal: true

require_relative 'test_case'
require_relative 'was_run'

class TestCaseTest < TestCase
  def test_template_method
    test = WasRun.new(:test_method)
    test.run
    raise unless test.log == 'setup test_method tear_down '

    puts 'success'
  end
end

TestCaseTest.new(:test_template_method).run
