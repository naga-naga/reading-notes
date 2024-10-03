# frozen_string_literal: true

require_relative 'test_case'
require_relative 'was_run'

class TestCaseTest < TestCase
  def setup
    @test = WasRun.new(:test_method)
  end

  def test_running
    @test.run
    raise unless @test.was_run

    puts 'success'
  end

  def test_setup
    @test.run
    raise unless @test.was_setup

    puts 'success'
  end
end

TestCaseTest.new(:test_running).run
TestCaseTest.new(:test_setup).run
