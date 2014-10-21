require_relative 'Root'

module RubyUnit
  module Assertions
    module Comparisons
      include RubyUnit::AssertionMessage
      include Assertions::Root

      #
      # Assert that two values are equal.
      # * raises RubyUnit::AssertionFailure unless _expected_ equals _actual_
      #
      # expected::
      #   The value that is forbidden by the assertion
      #
      # actual::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertEqual 42, 24, "This will fail"  # => fail
      #
      def assertEqual expected, actual, message = nil
        __assert (expected == actual), ASSERT_EQUAL_ERROR, message, {:expected=>expected, :actual=>actual}
      end

      #
      # Assert that two values are NOT equal.
      # * raises RubyUnit::AssertionFailure if _illegal_ equals _actual_
      #
      # illegal::
      #   The value that is not allowed by the assertion
      #
      # actual::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertNotEqual 3.14, 3.14, "This will fail"  # => fail
      #
      def assertNotEqual illegal, actual, message = nil
        __reject (illegal == actual), ASSERT_NOT_EQUAL_ERROR, message, {:illegal=>illegal, :actual=>actual} 
      end

      #
      # Assert that one value is greater than another.
      # * raises RubyUnit::AssertionFailure unless _greater_ is greater than _value_
      #
      # greater::
      #   The value that should be greater
      #
      # value::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertGreaterThan 24, 42, "This will fail"  # => fail
      #
      def assertGreaterThan greater, value, message = nil
        __assert (greater > value), ASSERT_GREATERTHAN_ERROR, message, {:greater=>greater, :value=>value}
      end

      #
      # Assert that one value is greater than another.
      # * raises RubyUnit::AssertionFailure unless _greater_ is greater than or equal to _value_
      #
      # greater::
      #   The value that should be greater than or equal
      #
      # value::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertGreaterThanOrEqual 24, 42, "This will fail"  # => fail
      #
      def assertGreaterThanOrEqual greater, value, message = nil
        __assert (greater >= value), ASSERT_GREATERTHANOREQUAL_ERROR, message, {:greater=>greater, :value=>value}
      end

      #
      # Assert that one value is less than another.
      # * raises RubyUnit::AssertionFailure unless _less_ is less than _value_
      #
      # less::
      #   The value that should be less
      #
      # value::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertLessThan 42, 24, "This will fail"  # => fail
      #
      def assertLessThan less, value, message = nil
        __assert (less < value), ASSERT_LESSTHAN_ERROR, message, {:less=>less, :value=>value}
      end

      #
      # Assert that one value is less than another.
      # * raises RubyUnit::AssertionFailure unless _less_ is less than or equal to _value_
      #
      # less::
      #   The value that should be less than or equal
      #
      # value::
      #   The value that is being checked by the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertLessThanOrEqual 42, 24, "This will fail"  # => fail
      #
      def assertLessThanOrEqual less, value, message = nil
        __assert (less <= value), ASSERT_LESSTHANOREQUAL_ERROR, message, {:less=>less, :value=>value}
      end

      #
      # Assert that a value matches a Regexp pattern.
      # * raises RubyUnit::AssertionFailure unless _value_ matches _pattern_
      #
      # pattern::
      #   A Regexp pattern expected by the assertion
      #
      # value::
      #   The value that is being checked for the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertMatch /^Hello/, 'Goodbye!', "This will fail"  # => fail
      #
      def assertMatch pattern, value, message = nil
        pattern = [pattern] unless pattern.is_a? Array
        pattern.each do |regex|
          __assert (value =~ regex), ASSERT_MATCH_ERROR, message, {:pattern=>pattern, :value=>value}
        end
      end

      #
      # Assert that a value does not match a Regexp pattern.
      # * raises RubyUnit::AssertionFailure if _value_ matches _pattern_
      #
      # pattern::
      #   A Regexp pattern excluded by the assertion
      #
      # value::
      #   The value that is being checked for the assertion
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertMatch /^Good/, 'Goodbye!', "This will fail"  # => fail
      #
      def assertNotMatch exclusion, value, message = nil
        __reject (value =~ exclusion), ASSERT_NO_MATCH_ERROR, message, {:exclusion=>exclusion, :value=>value}
      end

      #
      # Assert that two objects are the same object
      # * raises RubyUnit::AssertionFailure unless _expected_ and _actual_ are
      #   the same object.
      #
      # expected::
      #   The expected object
      #
      # actual::
      #   The object that is being checked against _expected_
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertSame '42', 42, 'Not even close.'  # => fail
      #
      def assertSame expected, actual, message = nil
        __assert (expected.equal? actual), ASSERT_SAME_ERROR, message, {:expected=>expected, :actual=>actual}
      end

      #
      # Assert that two objects are not the same object
      # * raises RubyUnit::AssertionFailure if _illegal_ and _actual_ are the
      #   same object.
      #
      # illegal::
      #   The expected that it shouldn't be
      #
      # actual::
      #   The object that is being checked against _illegal_
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertNotSame value, value, 'Imagine that!'  # => fail
      #
      def assertNotSame illegal, actual, message = nil
        __reject (illegal.equal? actual), ASSERT_NOT_SAME_ERROR, message, {:illegal=>illegal, :actual=>actual}
      end
    end
  end
end
