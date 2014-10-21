require_relative 'Root'

module RubyUnit
  module Assertions
    module Basic
      include RubyUnit::AssertionMessage
      include Assertions::Root

      ##
      # Fail the test. This is used when some conditioned outside the test warrants
      # a test failure.
      # * This is likely an indication of something unexpected or missing functionality
      # * raises RubyUnit::AssertionFailure
      #
      # message::
      #   The message provided to be reported for a failure
      #
      # data::
      #   The data associated with assertion
      #
      #  fail "I wasn't expecting the moon to fall into Lake Michigan"  # => fail
      #
      def fail message = nil, data = {}
        __assert_block FAILING, message, data
      end

      ##
      # Assert that a test condition is true.
      # * raises RubyUnit::AssertionFailure if _value_ is false or nil
      #
      # value::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assert false, "This will fail"  # => fail
      #
      def assert value, message = nil
        __assert value, ASSERT_ERROR, message, {:value=>value}
      end

      ##
      # Assert that a test condition is false.
      # * raises RubyUnit::AssertionFailure unless _value_ is false or nil
      #
      # value::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertNot true, "This will fail"  # => fail
      #
      def assertNot value, message = nil
        __reject value, ASSERT_NOT_ERROR, message, {:value=>value}
      end

      ##
      # Assert that a test condition is exactly true.
      # * raises RubyUnit::AssertionFailure unless _value_ is true
      #
      # value::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertTrue false, "This will fail"  # => fail
      #
      def assertTrue value, message = nil
        __assert (true == value), ASSERT_TRUE_ERROR, message, {:value=>value}
      end

      ##
      # Assert that a test condition is exactly false.
      # * raises RubyUnit::AssertionFailure unless _value_ is false
      #
      # value::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertNil true, "This will fail"  # => fail
      #
      def assertFalse value, message = nil
        __assert (false == value), ASSERT_FALSE_ERROR, message, {:value=>value}
      end

      ##
      # Assert that a test condition is exactly nil.
      # * raises RubyUnit::AssertionFailure unless _value_ is nil
      #
      # value::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertNil true, "This will fail"  # => fail
      #
      def assertNil value, message = nil
        __assert value.nil?, ASSERT_NIL_ERROR, message, {:value=>value}
      end

      ##
      # Assert that a test condition is not nil.
      # * raises RubyUnit::AssertionFailure if _value_ is nil
      #
      # value::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertNotNil nil, "This will fail"  # => fail
      #
      def assertNotNil value, message = nil
        __reject value.nil?, ASSERT_NOT_NIL_ERROR, message, {:value=>value}
      end
    end
  end
end
