module RubyUnit
  module Assertions
    include AssertionMessage

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
      __assert (expected == actual), 'Failed to assert that values are equal', message, {:expected=>expected, :actual=>actual}
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
      __reject (illegal == actual), 'Values should NOT be equal', message, {:illegal=>illegal, :actual=>actual} 
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
      __assert (greater > value), 'Failed to assert that value is greater than', message, {:greater=>greater, :value=>value}
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
      __assert (greater >= value), 'Failed to assert that value is greater than or equal', message, {:greater=>greater, :value=>value}
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
      __assert (less < value), 'Failed to assert that value is less than', message, {:less=>less, :value=>value}
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
      __assert (less <= value), 'Failed to assert that value is less than or equal', message, {:less=>less, :value=>value}
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
      pattern = [pattern] if not pattern.is_a? Array
      pattern.each do |regex|
        __assert (value =~ regex), 'Failed to assert value matches pattern', message, {:pattern=>pattern, :value=>value}
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
      __reject (value =~ exclusion), 'Value should NOT match exclusion', message, {:exclusion=>exclusion, :value=>value}
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
      __assert (expected.equal? actual), 'Failed to assert objects are the same', message, {:expected=>expected, :actual=>actual}
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
      __reject (illegal.equal? actual), 'Objects shoul NOT be the same', message, {:illegal=>illegal, :actual=>actual}
    end
  end
end
