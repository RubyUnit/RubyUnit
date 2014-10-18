require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Comparison'

module AssertionsTests
  #
  # Test Case for RubyUnit::Assertions module
  #
  class TC_Comparison < AssertionsTestCase
    include ComparisonData
  end
end
