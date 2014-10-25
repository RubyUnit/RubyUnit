require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Exceptions'

module AssertionsTests
  #
  # Test Case for RubyUnit::Assertions Exceptions assertions
  #
  class TC_Exceptions < AssertionsTestCase
    include ExceptionsData

    def assertNothingRaisedTest block_data
      assertNothingRaised do
        block_data
      end
    end

    def assertNothingRaisedWithMessageTest block_data, message
      assertNothingRaised message do
        block_data
      end
    end
  end
end
