
module RubyUnit
  #
  # All classes derrived from the RubyUnit::TestCase will automatically be run by
  # the test runner.
  # * Test methods must currently be named ending in 'Test'
  # * Data methods must currently be named ending in 'Data'
  #   All data methods must return an array of arrays as param lists to passed to
  #   the corresponding test method.
  # * Exceptions raised in this class are generally caught by the RubyUnit::Runner
  #
  #  MyTest < RubyUnit::TestCase
  #    def simpleData
  #      [
  #        [       1,   3],
  #        ['string', nil],
  #      ],
  #    end
  #
  #    def simpleTest param1, param2
  #      # run assertions
  #    end
  #  end
  #
  module Assertions
    # Tracks the total number of assertions made during the tests
    @@assertions = 0

    #
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
      build_message 'Failing test', message, data
    end

    #
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
      __assert value, 'Failed to assert that value is false or nil', message, {:value=>value}
    end

    #
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
      __reject value, 'Value should NOT be false or nil', message, {:value=>value}
    end

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
        __assert (value =~ pattern), 'Failed to assert value matches pattern', message, {:pattern=>pattern, :value=>value}
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

    #
    # Assert that an object is an instance of the specified class or one of
    # its descendents.
    # * raises RubyUnit::AssertionFailure unless _object_ is an instance of
    #   _klass_ or one of its descendents. 
    #
    # klass::
    #   The class that is expected
    #
    # object::
    #   The object that will be checked against _klass_
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertKindOf String, 25, 'Nope, try again.'  # => fail
    #
    def assertKindOf klass, object, message = nil
      __assert (object.is_a? klass), 'Failed to assert object heritage', message, {:klass=>klass, :object=>object}
    end
    
    alias_method :assertIsA, :assertKindOf

    #
    # Assert that an object is not an instance of the specified class or one of
    # its descendents.
    # * raises RubyUnit::AssertionFailure if _object_ is an instance of _exclusion_ or
    # one of its descendents. 
    #
    # exclusion::
    #   The class that is excluded
    #
    # object::
    #   The object that will be checked against _klass_
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertNotKindOf Numeric, 25, 'Nope, try again.'  # => fail
    #
    def assertNotKindOf exclusion, object, message = nil
      __reject (object.is_a? exclusion), 'Object should not be a descendent', message, {:exclusion=>exclusion, :object=>object}
    end

    [:assertNotIsA, :assertIsNotA].each do |method|
      alias_method method, :assertNotKindOf
    end

    #
    # Assert that an object is an instance of a specified class
    # * raises RubyUnit::AssertionFailure unless _object_ is an instance of _klass_.
    #
    # klass::
    #   The class that is expected
    #
    # object::
    #   The object that will be checked against _klass_
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertInstanceOf Integer, '25', 'So close, but... No.'  # => fail
    #
    def assertInstanceOf klass, object, message = nil
      __assert (object.instance_of? klass), 'Failed to assert object instance', message, {:klass=>klass, :object=>object}
    end

    #
    # Assert that an object is an instance of a specified class
    # * raises RubyUnit::AssertionFailure unless _object_ is an instance of _klass_.
    #
    # exclusion::
    #   The class that is expected
    #
    # object::
    #   The object that will be checked against _klass_
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertNotInstanceOf Integer, 25, 'So close, but... No.'  # => fail
    #
    def assertNotInstanceOf exclusion, object, message = nil
      __reject (object.instance_of? exclusion), 'Object should NOT be this instance', message, {:exclusion=>exclusion, :object=>object}
    end

    #
    # Assert that a constant is defined correctly in the correct class
    # * raises RubyUnit::AssertionFailure unless the constant is defined in
    #   the specified class and it is the correct type and value
    #
    # expected::
    #   The value that is expected for the constant
    #
    # klass::
    #   The class where the constant should be defined
    #
    # konstant::
    #   The name of the constant
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertConst 42, Numbers, 'TWENTYFOUR', 'So dyslexic.'  # => fail
    #
    def assertConst expected, klass, konstant, message = nil
      __wrap_assertion do
        assertConstDefined klass, konstant, message
        value = klass.const_get konstant
        assertIsA expected.class, value, message
        assertEqual expected, value, message
      end
    end

    #
    # Assert that a constant is defined in the specified class
    # * raises RubyUnit::AssertionFailure unless the constant is defined in
    #   the specified class
    #
    # klass::
    #   The class where the constant should be defined
    #
    # konstant::
    #   The name of the constant
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertConstDefined Numbers, 'FORTYTWO', 'Mystery.'  # => ??
    #
    def assertConstDefined klass, konstant, message = nil
      __assert (klass.const_defined? konstant), 'Failed to assert constant is defined', message, {:klass=>klass, :konstant=>konstant}
    end

    #
    # Assert that a constant is not defined in the specified class
    # * raises RubyUnit::AssertionFailure if the constant is defined in
    #   the specified class
    #
    # klass::
    #   The class where the constant should not be defined
    #
    # konstant::
    #   The name of the constant
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertConstNotDefined Numbers, 'TWENTYFOUR', 'Mystery.'  # => ??
    #
    def assertConstNotDefined klass, konstant, message = nil
      __reject (klass.const_defined? konstant), 'Constant should not be defined', message, {:klass=>klass, :konstant=>konstant}
    end

    #
    # Assert that no exception is raised.
    # * raises RubyUnit::AssertionFailure if any exception is raised
    #
    # message::
    #   The message provided to be reported for a failure
    #
    # &block::
    #   The code block that is executed
    #
    #  assertNothingRaised 'Not expecting an exception!' do
    #    # do something
    #  end
    #
    def assertNothingRaised message = nil, &block
      __wrap_assertion do
        begin
          yield
        rescue Exception => e
          build_message 'Exception should NOT be raised', message, {:exception=>e.message}
        end
      end
    end

    #
    # Assert that a specified exception message is raised.
    # * raises RubyUnit::AssertionFailure unless the correct Exception message is raised
    #
    # pattern::
    #   The String or Regexp that will be used to validate the Exception message
    #
    # message::
    #   The message provided to be reported for a failure
    #
    # &block::
    #   The code block that is expected to throw the Exception
    #
    #  assertRaiseMessage /^Invalid/, 'Expecting an exception!' do
    #    # do something
    #  end
    #
    def assertRaiseMessage pattern, message = nil, &block
      assertRaiseExpected Exception, pattern, message, &block
    end

    #
    # Assert that a specified exception type is raised.
    # * raises RubyUnit::AssertionFailure unless the correct Exception type is raised
    #
    # e::
    #   The Exception class that is expected.
    #
    # message::
    #   The message provided to be reported for a failure
    #
    # &block::
    #   The code block that is expected to throw the Exception
    #
    #  assertRaiseKindOf StandardError, 'Expecting an exception!' do # => fail
    #    # do something
    #  end
    #
    def assertRaiseKindOf e, message = nil, &block
      assertRaiseExpected e, '', message, &block
    end

    #
    # Assert that a specified exception is raised.
    # * raises RubyUnit::AssertionFailure unless the correct Exception is raised
    #
    # exception::
    #   The Exception class that is expected.
    #
    # pattern::
    #   The String or Regexp that will be used to validate the Exception message
    #
    # message::
    #   The message provided to be reported for a failure
    #
    # &block::
    #   The code block that is expected to throw the Exception
    #
    #  assertRaiseExpected StandardError, /^Invalid/, 'Expecting an exception!' do
    #    raise StandardError, 'Invalid Retroincabulator'
    #  end
    #
    def assertRaiseExpected exception, pattern, message = nil, &block
      __validate_exception pattern, exception
      __wrap_assertion do
        begin
          yield
          build_message 'Expected exception was not raised', message, {:exception=>exception, :pattern=>pattern}
        rescue exception => e
          assertEqual pattern, e.message if pattern.is_a? String and pattern.length > 0
          assertMatch pattern, e.message if pattern.is_a? Regexp
        end
      end
    end

    private
    #
    # Builds the message that will be used with the assertion
    # * raises RubyUnit::AssertionFailure
    # * raises ArgumentError unless error is a String
    # * raises ArgumentError unless message is nil or a String
    # * raises ArgumentError unless data is a Hash
    #
    # error::
    #   The assertion description
    #
    # message::
    #   The message provided by the test for the assertion
    #
    # data::
    #   The data associated with assertion failure
    #
    #  build_message 'Failing Test', message, {'expected' => expected, 'actual' => actual }
    #
    def build_message error, message, data = {} # :nodoc:
      raise ArgumentError, 'Error description must be a String' unless error.is_a? String
      raise ArgumentError, 'Failure message must be String' unless message.nil? or message.is_a? String
      raise ArgumentError, 'Failure data must be a Hash' unless data.is_a? Hash

      error_message  = error
      error_message << "\n#{message}" if not message.nil?
      data.each do |index, value|
        error_message << "\n#{index}:\n\t#{value.inspect}"
      end
      raise AssertionFailure, error_message
    end

    #
    # The assertion wrapper is responsible for doing everything that must be done
    # on each assertion.
    # * keep track of the total number of assertions
    #
    # &block::
    #   The assertion which is being wrapped
    #
    def __wrap_assertion &block # :nodoc:
      @@assertions += 1
      yield
    end

    #
    # Internally validate that an assertion not false or nil
    # * raises RubyUnit::AssertionFailure unless _value_ is true 
    #
    # value::
    #   The value to be asserted
    #
    # error::
    #   The error associated with the assertion being checked
    #
    # message::
    #   The message provided to be reported for a failure
    #
    # data::
    #   The data associated with assertion
    #
    #  __assert value, 'Failed to assert value is true', message, {:value=>value}
    #
    def __assert value, error, message, data # :nodoc:
      __wrap_assertion do
        build_message error, message, data unless value
      end
    end

    #
    # Internally validate that an assertion is false or nil
    # * raises RubyUnit::AssertionFailure unless _value_ is false or nil 
    #
    # value::
    #   The value to be asserted
    #
    # error::
    #   The error associated with the assertion being checked
    #
    # message::
    #   The message provided to be reported for a failure
    #
    # data::
    #   The data associated with assertion
    #
    #  __reject value, 'Failed to assert value is not true', message, {:value=>value}
    #
    def __reject value, error, message, data # :nodoc:
      __assert (not value), error, message, data
    end

    #
    # Validate the parameters for exception assertions
    # * raises ArgumentError if _pattern_ is not a String or Regexp
    # * raises ArgumentError unless _e_ is a descendent of the Exception class
    #
    def __validate_exception pattern, e = Exception
      raise ArgumentError, "Exception message must be a Regexp or String" unless pattern.is_a? Regexp or pattern.is_a? String
      raise ArgumentError, "Exception must be a subclass of Exception" unless e < Exception
    end
  end
end
