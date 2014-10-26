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
      rescue_assertion /#{ASSERT_NOTHING_RAISED_ERROR}/ do
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
      rescue_assertion /#{ASSERT_NOTHING_RAISED_ERROR}/, message do
        assertNothingRaised message do
          raise Exception exception
        end
      end
    end

    def assertRaiseMessageTest pattern, exception, error
      assertRaiseMessage pattern do
        raise exception, error
      end
    end

    def assertRaiseMessageFailTest pattern, exception, error
      rescue_assertion /#{ASSERT_RAISE_MESSAGE_ERROR}/ do
        assertRaiseMessage pattern do
          raise exception, error
        end
      end
    end

    def assertRaiseMessageInvalidTest exception
      rescue_assertion /#{ASSERT_RAISE_MESSAGE_ERROR}/ do
        assertRaiseMessage /Message pattern must be a Regexp or String/ do
          raise exception, 'Message raised'
        end
      end
    end

    def assertRaiseMessageWithMessageTest pattern, exception, error, message
      assertRaiseMessage pattern, message do
        raise exception, error, message
      end
    end

    def assertRaiseMessageWithMessageFailTest pattern, exception, error, message
      rescue_assertion /#{ASSERT_RAISE_MESSAGE_ERROR}/, message do
        assertRaiseMessage pattern, message do
          raise exception, error
        end
      end
    end

    def assertRaiseMessageWithMessageInvalidTest exception, message
      rescue_assertion /#{ASSERT_RAISE_MESSAGE_ERROR}/, message do
        assertRaiseMessage /Message pattern must be a Regexp or String/, message do
          raise exception, 'Message raised'
        end
      end
    end

    def assertRaiseKindOfTest exception
      assertRaiseKindOf exception do
        raise assertRaiseKindOf
      end
    end

    def assertRaiseKindOfWithMessageTest exception, message
      assertRaiseKindOf exception, message do
        raise assertRaiseKindOf
      end
    end
  end
end
