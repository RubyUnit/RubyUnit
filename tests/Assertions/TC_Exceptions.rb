require 'RubyUnit/Assertions'

# Data provider for RubyUnit::Assertions Exceptions tests
require_relative 'data/Exceptions'

# Fixture for Exceptions tests
require_relative 'fixture/Exceptions'

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

    def assertNothingRaisedFailTest
      rescue_assertion /#{ASSERT_NOTHING_RAISED_ERROR}/ do
        assertNothingRaised do
          raise
        end
      end
    end

    def assertNothingRaisedWithMessageTest block_data, message
      assertNothingRaised message do
        block_data
      end
    end

    def assertNothingRaisedWithMessageFailTest message
      rescue_assertion /#{ASSERT_NOTHING_RAISED_ERROR}/, message do
        assertNothingRaised message do
          raise
        end
      end
    end

    def assertRaiseMessageTest pattern, exception, error
      assertRaiseMessage pattern do
        raise exception, error
      end
    end

    def assertRaiseMessageFailTest pattern, exception
      rescue_assertion /#{ASSERT_RAISE_MESSAGE_ERROR}/ do
        assertRaiseMessage pattern do
          raise exception
        end
      end
    end

    def assertRaiseMessageInvalidTest pattern
      assertRaiseKindOf TypeError do
        assertRaiseMessage pattern do
          raise
        end
      end
    end

    def assertRaiseMessageWithMessageTest pattern, exception, error, message
      assertRaiseMessage pattern, message do
        raise exception, error
      end
    end

    def assertRaiseMessageWithMessageFailTest pattern, exception, message
      rescue_assertion /#{ASSERT_RAISE_MESSAGE_ERROR}/, message do
        assertRaiseMessage pattern, message do
          raise exception
        end
      end
    end

    def assertRaiseMessageWithMessageInvalidTest pattern, message
      assertRaiseKindOf TypeError do
        assertRaiseMessage pattern, message do
          raise
        end
      end
    end

    def assertRaiseKindOfTest exception
      assertRaiseKindOf exception do
        raise exception
      end
    end

    def assertRaiseKindOfFailTest exception
      rescue_assertion /#{ASSERT_RAISE_KIND_OF_ERROR}/ do
        assertRaiseKindOf AssertionsTestsError do
          raise exception
        end
      end
    end

    def assertRaiseKindOfInvalidTest exception
      assertRaiseKindOf TypeError do
        assertRaiseKindOf exception do
          raise
        end
      end
    end

    def assertRaiseKindOfWithMessageTest exception, message
      assertRaiseKindOf exception, message do
        raise exception
      end
    end

    def assertRaiseKindOfWithMessageFailTest exception, message
      rescue_assertion /#{ASSERT_RAISE_KIND_OF_ERROR}/, message do
        assertRaiseKindOf AssertionsTestsError, message do
          raise exception
        end
      end
    end

    def assertRaiseKindOfWithMessageInvalidTest exception, message
      assertRaiseKindOf TypeError do
        assertRaiseKindOf exception, message do
          raise
        end
      end
    end

    def assertRaiseExpectedTest pattern, exception, error
      assertRaisedExpected exception, pattern do
        raise exception, error
      end
    end
  end
end
