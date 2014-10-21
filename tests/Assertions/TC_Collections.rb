require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Collections'

module AssertionsTests
  #
  # Test Case for RubyUnit::Assertions Collections assertions
  #
  class TC_Collections < AssertionsTestCase
    include CollectionsData
  end
end
