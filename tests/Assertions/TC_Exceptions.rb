require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Exceptions'

module AssertionsTests
  #
  # Test Case for RubyUnit::Assertions Exceptions assertions
  #
  class TC_Exceptions < AssertionsTestCase
    include ExceptionsData
  end
end
