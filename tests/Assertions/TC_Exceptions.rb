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

    ##
    # Test assertNothingRaised
    #
    # block_data::
    #   block to be asserted
    #
    def assertNothingRaisedTest block_data
      assertNothingRaised do
        block_data
      end
    end

    ##
    # Test assertNothingRaised failure
    #
    def assertNothingRaisedFailTest
      rescue_assertion /#{ASSERT_NOTHING_RAISED_ERROR}/ do
        assertNothingRaised do
          raise
        end
      end
    end

    ##
    # Test assertNothingRaised with message
    #
    # block_data::
    #   block to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertNothingRaisedWithMessageTest block_data, message
      assertNothingRaised message do
        block_data
      end
    end

    ##
    # Test assertNothingRaised with message failure
    #
    # message::
    #   The assertion message
    #
    def assertNothingRaisedWithMessageFailTest message
      rescue_assertion /#{ASSERT_NOTHING_RAISED_ERROR}/, message do
        assertNothingRaised message do
          raise
        end
      end
    end

    ##
    # Test assertRaiseMessage
    #
    # pattern::
    #   The pattern to match the exception
    #
    # exception::
    #   The exception to raise
    #
    # error::
    #   The exception message
    #
    def assertRaiseMessageTest pattern, exception, error
      assertRaiseMessage pattern do
        raise exception, error
      end
    end

    ##
    # Test assertRaiseMessage failure
    #
    # pattern::
    #   The pattern to match the exception
    #
    # exception::
    #   The exception to raise
    #
    # error::
    #   The exception message
    #
    def assertRaiseMessageFailTest pattern, exception, error
      rescue_assertion /#{ASSERT_RAISE_MESSAGE_ERROR}/ do
        assertRaiseMessage pattern do
          raise exception, error
        end
      end
    end

    ##
    # Test assertRaiseMessage with invalid input
    #
    # pattern::
    #   The pattern to match the exception
    #
    def assertRaiseMessageInvalidTest pattern
      assertRaiseKindOf TypeError do
        assertRaiseMessage pattern do
          raise
        end
      end
    end

    ##
    # Test assertRaiseMessage with message
    #
    # pattern::
    #   The pattern to match the exception
    #
    # exception::
    #   The exception to raise
    #
    # error::
    #   The exception message
    #
    # message::
    #   The assertion message
    #
    def assertRaiseMessageWithMessageTest pattern, exception, error, message
      assertRaiseMessage pattern, message do
        raise exception, error
      end
    end

    ##
    # Test assertRaiseMessage with message failure
    #
    # pattern::
    #   The pattern to match the exception
    #
    # exception::
    #   The exception to raise
    #
    # error::
    #   The exception message
    #
    # message::
    #   The assertion message
    #
    def assertRaiseMessageWithMessageFailTest pattern, exception, error, message
      rescue_assertion /#{ASSERT_RAISE_MESSAGE_ERROR}/, message do
        assertRaiseMessage pattern, message do
          raise exception, error
        end
      end
    end

    ##
    # Test assertRaiseMessage with invalid input with message
    #
    # pattern::
    #   The pattern to match the exception
    #
    # message::
    #   The assertion message
    #
    def assertRaiseMessageWithMessageInvalidTest pattern, message
      assertRaiseKindOf TypeError do
        assertRaiseMessage pattern, message do
          raise
        end
      end
    end

    ##
    # Test assertRaiseKindOf
    #
    # exception::
    #   The exception to raise
    #
    def assertRaiseKindOfTest exception
      assertRaiseKindOf exception do
        raise exception
      end
    end

    ##
    # Test assertRaiseKindOf failure
    #
    # exception::
    #   The exception to raise
    #
    def assertRaiseKindOfFailTest exception
      rescue_assertion /#{ASSERT_RAISE_KIND_OF_ERROR}/ do
        assertRaiseKindOf AssertionsTestsError do
          raise exception
        end
      end
    end

    ##
    # Test assertRaiseKindOf with invalid input
    #
    # exception::
    #   The exception to raise
    #
    def assertRaiseKindOfInvalidTest exception
      assertRaiseKindOf TypeError do
        assertRaiseKindOf exception do
          raise
        end
      end
    end

    ##
    # Test assertRaiseKindOf with message
    #
    # exception::
    #   The exception to raise
    #
    # message::
    #   The assertion message
    #
    def assertRaiseKindOfWithMessageTest exception, message
      assertRaiseKindOf exception, message do
        raise exception
      end
    end

    ##
    # Test assertRaiseKindOf with message failure
    #
    # exception::
    #   The exception to raise
    #
    # message::
    #   The assertion message
    #
    def assertRaiseKindOfWithMessageFailTest exception, message
      rescue_assertion /#{ASSERT_RAISE_KIND_OF_ERROR}/, message do
        assertRaiseKindOf AssertionsTestsError, message do
          raise exception
        end
      end
    end

    ##
    # Test assertRaiseKindOf with invalid input with message
    #
    # exception::
    #   The exception to raise
    #
    # message::
    #   The assertion message
    #
    def assertRaiseKindOfWithMessageInvalidTest exception, message
      assertRaiseKindOf TypeError do
        assertRaiseKindOf exception, message do
          raise
        end
      end
    end

    ##
    # Test assertRaiseExpected
    #
    # pattern::
    #   The pattern to match the exception
    #
    # exception::
    #   The exception to raise
    #
    # error::
    #   The exception message
    #
    def assertRaiseExpectedTest pattern, exception, error
      assertRaiseExpected exception, pattern do
        raise exception, error
      end
    end

    ##
    # Test assertRaiseExpected failure
    #
    # pattern::
    #   The pattern to match the exception
    #
    # expected::
    #   The exception that is expected to be raised
    #
    # exception::
    #   The exception to raise
    #
    # error::
    #   The exception message
    #
    def assertRaiseExpectedFailTest pattern, expected, exception, error
      rescue_assertion /#{ASSERT_RAISE_EXPECTED_ERROR}/ do
        assertRaiseExpected expected, pattern do
          raise exception, error
        end
      end
    end

    ##
    # Test assertRaiseExpected with invalid exception
    #
    # pattern::
    #   The pattern to match the exception
    #
    # expected::
    #   The exception that is expected to be raised
    #
    def assertRaiseExpectedInvalidExceptionTest pattern, expected
      assertRaiseKindOf TypeError do
        assertRaiseExpected expected, pattern do
          raise StandardError, pattern
        end
      end
    end

    ##
    # Test assertRaiseExpected with invalid error
    #
    # pattern::
    #   The pattern to match the exception
    #
    # expected::
    #   The exception that is expected to be raised
    #
    def assertRaiseExpectedInvalidErrorTest pattern, expected
      assertRaiseKindOf TypeError do
        assertRaiseExpected expected, pattern do
          raise StandardError, pattern
        end
      end
    end

    ##
    # Test assertRaiseExpected with invalid exception and error
    #
    # pattern::
    #   The pattern to match the exception
    #
    # expected::
    #   The exception that is expected to be raised
    #
    def assertRaiseExpectedInvalidBothTest pattern, expected
      assertRaiseKindOf TypeError do
        assertRaiseExpected expected, pattern do
          raise StandardError, pattern
        end
      end
    end

    ##
    # Test assertRaiseExpected with message
    #
    # pattern::
    #   The pattern to match the exception
    #
    # exception::
    #   The exception to raise
    #
    # error::
    #   The exception message
    #
    # message::
    #   The assertion message
    #
    def assertRaiseExpectedWithMessageTest pattern, exception, error, message
      assertRaiseExpected exception, pattern, message do
        raise exception, error
      end
    end

    ##
    # Test assertRaiseExpected with message failure
    #
    # pattern::
    #   The pattern to match the exception
    #
    # expected::
    #   The exception that is expected to be raised
    #
    # exception::
    #   The exception to raise
    #
    # error::
    #   The exception message
    #
    # message::
    #   The assertion message
    #
    def assertRaiseExpectedWithMessageFailTest pattern, expected, exception, error, message
      rescue_assertion /#{ASSERT_RAISE_EXPECTED_ERROR}/ do
        assertRaiseExpected expected, pattern, message do
          raise exception, error
        end
      end
    end

    ##
    # Test assertRaiseExpected with invalid exception with message
    #
    # pattern::
    #   The pattern to match the exception
    #
    # expected::
    #   The exception that is expected to be raised
    #
    # message::
    #   The assertion message
    #
    def assertRaiseExpectedInvalidExceptionWithMessageTest pattern, expected, message
      assertRaiseKindOf TypeError do
        assertRaiseExpected expected, pattern, message do
          raise StandardError, pattern
        end
      end
    end

    ##
    # Test assertRaiseExpected with invalid error with message
    #
    # pattern::
    #   The pattern to match the exception
    #
    # expected::
    #   The exception that is expected to be raised
    #
    # message::
    #   The assertion message
    #
    def assertRaiseExpectedInvalidErrorWithMessageTest pattern, expected, message
      assertRaiseKindOf TypeError do
        assertRaiseExpected expected, pattern, message do
          raise StandardError, pattern
        end
      end
    end

    ##
    # Test assertRaiseExpected with invalid exception and error with message
    #
    # pattern::
    #   The pattern to match the exception
    #
    # expected::
    #   The exception that is expected to be raised
    #
    # message::
    #   The assertion message
    #
    def assertRaiseExpectedInvalidBothWithMessageTest pattern, expected, message
      assertRaiseKindOf TypeError do
        assertRaiseExpected expected, pattern, message do
          raise StandardError, pattern
        end
      end
    end
  end
end
