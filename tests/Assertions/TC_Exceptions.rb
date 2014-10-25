require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Exceptions'

module AssertionsTests
  ##
  # Test Case for RubyUnit::Assertions Exceptions assertions
  #
  class TC_Exceptions < AssertionsTestCase
    include ExceptionsData

    def assertNothingRaisedTest block_data
      assertNothingRaised do
        block_data
      end
    end

    def assertNothingRaisedFailTest exception
      rescue_assertion ASSERT_NOTHING_RAISED_ERROR do
        assertNothingRaised do
          raise Exception exception
        end
      end
    end

    def assertNothingRaisedWithMessageTest block_data, message
      assertNothingRaised message do
        block_data
      end
    end

    def assertNothingRaisedWithMessageFailTest exception, message
      rescue_assertion ASSERT_NOTHING_RAISED_ERROR, message do
        assertNothingRaised message do
          raise Exception exception
        end
      end
    end
  end
end
