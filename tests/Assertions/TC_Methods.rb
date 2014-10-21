require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Methods'

module AssertionsTests
  #
  # Test Case for RubyUnit::Assertions Methods assertions
  #
  class TC_Methods < AssertionsTestCase
    include MethodsData
  end
end
