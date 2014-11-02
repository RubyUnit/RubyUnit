require_relative 'TestSet'

module RubyUnit
  TYPE = 'Test Set'

  ##
  # Test Suites are a collection of test sets
  # TestSuite is a larger concept of TestSet
  class TestSuite < TestSet
    def self.type
      'Test Set'
    end
  end
end
