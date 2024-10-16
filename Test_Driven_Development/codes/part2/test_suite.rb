# frozen_string_literal: true

class TestSuite
  def initialize
    @tests = []
  end

  def add(test)
    @tests << test
  end

  def run(result)
    @tests.each do |test|
      test.run(result)
    end
  end
end
