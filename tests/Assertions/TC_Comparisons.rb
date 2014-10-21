require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Comparisons'

module AssertionsTests
  #
  # Test Case for RubyUnit::Assertions Comparisons assertions
  #
  class TC_Comparisons < AssertionsTestCase
    include ComparisonsData
  end
end
