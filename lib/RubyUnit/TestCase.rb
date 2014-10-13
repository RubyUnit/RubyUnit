require_relative 'AssertionFailure'

module RubyUnit
  #
  # = RubyUnit::TestCase
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
  class TestCase
    public

    #
    # The setup helper that is run before each test in the test case.
    #
    #  def setup
    #    # create objects, set up the scenario
    #  end
    #
    def setup
    end

    #
    # The teardown helper that is run after each test in the test case.
    #
    #  def teardown
    #    # destroy objects, clean up after yourself
    #  end
    #
    def teardown
    end

    private
    #
    # The assertion wrapper is responsible for doing everything that must be done
    # on each assertion.
    # * keep track of the total number of assertions
    #
    # &block::
    #   The assertion which is being wrapped
    #
    def __assertion &block # :nodoc:
      @@assertions += 1
      yield
    end

    protected
    
    #
    # Fail the test. This is used when some conditioned outside the test warrants
    # a test failure.
    # * This is likely an indication of something unexpected or missing functionality
    # * raises RubyUnit::AssertionFailure
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  fail "I wasn't expecting the moon to fall into Lake Michigan"  # => fail
    #
    def fail message = nil
      __assertion do
        raise AssertionFailure, message
      end
    end

    #
    # Assert that a test condition is true.
    # * raises RubyUnit::AssertionFailure unless _expected_ is true
    #
    # expected::
    #   The value that is being checked for the assertion
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assert false "This will fail"  # => fail
    #
    def assert expected, message = nil
      __assertion do
        raise AssertionFailure, message unless expected
      end
    end

    #
    # Assert that a test condition is false.
    # * raises RubyUnit::AssertionFailure if _expected_ is true
    #
    # expected::
    #   The value that is being checked for the assertion
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertNot true "This will fail"  # => fail
    #
    def assertNot expected, message = nil
      __assertion do
        raise AssertionFailure, message if expected
      end
    end

    #
    # Assert that two values are equal.
    # * raises RubyUnit::AssertionFailure unless _expected_ equals _actual_
    #
    #--
    # TODO It probably makes sense to rename _expected_ here
    #++
    # expected::
    #   The value that is expected by the assertion
    #
    # actual::
    #   The value that is being checked for the assertion
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertEqual 42, 24 "This will fail"  # => fail
    #
    def assertEqual expected, actual, message = nil
      __assertion do
        raise AssertionFailure, message unless expected == actual
      end
    end

    #
    # Assert that two values are NOT equal.
    # * raises RubyUnit::AssertionFailure if _expected_ equals _actual_
    #
    # expected::
    #   The value that is not allowed by the assertion
    #
    # actual::
    #   The value that is being checked for the assertion
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertNotEqual 3.14, 3.14 "This will fail"  # => fail
    #
    def assertNotEqual expected, actual, message = nil
      __assertion do
        raise AssertionFailure, message if expected == actual
      end
    end

    #
    # Assert that a value matches a Regexp pattern.
    # * raises RubyUnit::AssertionFailure unless _actual_ matches _pattern_
    #
    # pattern::
    #   A Regexp pattern expected by the assertion
    #
    # actual::
    #   The value that is being checked for the assertion
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertMatch /^Hello/, 'Goodbye!', "This will fail"  # => fail
    #
    def assertMatch pattern, actual, message = nil
      __assertion do
        raise AssertionFailure, message unless actual =~ pattern
      end
    end

    #
    # Assert that a specified exception is raised.
    # * raises RubyUnit::AssertionFailure unless the correct Exception is raised
    # * raises ArgumentError unless the parameter count is positive
    # * raises ArgumentError unless the first parameter is a descendent of the
    #   Exception class
    # * raises ArgumentError if the second parameter is provided and is not a
    #   String, Regexp or nil
    # * raises ArgumentError if the third parameter is provided and is not a
    #   String or nil
    #
    # *args::
    #   List of arguments passed in as [expected, pattern, message]. Additional
    #   parameters are ignored.
    #
    # expected::
    #   *required*: The Exception class that is expected.  The Exception must be a
    #   descendent of the Exception class.
    #
    # pattern::
    #   _optional_: The String or Regexp that will be used to validate the Exception
    #   message
    #
    # message::
    #   _optional_: The message provided to be reported for a failure
    #
    # &block::
    #   The code block that is expected to throw the Exception
    #
    #  assertRaiseExpected Exception, /^Invalid/, 'Expecting an exception!' do
    #    raise 'Invalid Retroincabulator'
    #  end
    #
    def assertRaiseExpected *args, &block
      __assertion do
        raise ArgumentError, "wrong number of arguments (#{args.count} for 2..3)" unless args.count > 0 
        expected, pattern, message = args
        raise ArgumentError, "expected exception must be a subclass of Exception" unless expected < Exception
        raise ArgumentError, "exception message must be a Regexp or String" unless pattern.is_a? Regexp or pattern.is_a? String or pattern.nil?
        raise ArguemntError, "message must be a String or nil" unless message.is_a? String or message.nil?

        begin
          yield
          raise AssertionFailure, message
        rescue expected => e
          if pattern.is_a? String
            assertEqual pattern, e.message
          elsif pattern.is_a? Regexp
            assertMatch pattern, e.message
          end
        end
      end
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
      __assertion do
        begin
          yield
        rescue
          raise AssertionFailure, message
        end
      end
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
    #  assertIsA String, 25, 'Nope, try again.'  # => fail
    #
    def assertIsA klass, object, message = nil
      __assertion do
        raise AssertionFailure, message unless object.is_a? klass
      end
    end

    #
    # Assert that an object is an instance of a specified class
    # * raises RubyUnit::AssertionFailure unless _object_ is an instance of
    #   _klass_.
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
      __assertion do
        raise AssertionFailure, message unless object.instance_of? klass
      end
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
      __assertion do
        raise AssertionFailure, message unless expected.equal? actual
      end
    end

    #
    # Assert that two objects are not the same object
    # * raises RubyUnit::AssertionFailure if _expected_ and _actual_ are the
    #   same object.
    #
    #--
    # TODO It probably makes sense to rename this one too
    #++
    # expected::
    #   The expected that it shouldn't be
    #
    # actual::
    #   The object that is being checked against _expected_
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  value = 42
    #  assertSame value, value, 'Imagine that!'  # => fail
    #
    def assertNotSame expected, actual, message = nil
      __assertion do
        raise AssertionFailure, message if expected.equal? actual
      end
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
    #   The name of the constant expressed as a String so that it can be
    #   validated in the class
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertConst 42, Numbers, 'TWENTYFOUR', 'So dyslexic.'  # => fail
    #
    def assertConst expected, klass, konstant, message = nil
      __assertion do
        value = klass.const_get konstant
        assertIsA expected.class, value, message
        assertEqual expected, value, message
      end
    end

    class << self
      private
      # Tracks the total number of assertions made during the tests
      @@assertions = 0

      public
      #
      # Gets a list of all the descendents of the RubyUnit::TestCase class.
      # This is important when determining the tests that have been defined.
      #
      def descendents
        ObjectSpace.each_object(Class).select do |object|
          object < self
        end
      end

      #
      # Gets the current number of assertions that have been run while testing
      #
      def assertions
        @@assertions
      end
    end
  end
end