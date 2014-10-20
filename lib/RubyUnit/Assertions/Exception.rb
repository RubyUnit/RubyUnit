module RubyUnit
  module Assertions
    include AssertionMessage
    
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
      __assert_block do
        begin
          yield
          true # just in case the block yields 'false' or 'nil'
        rescue Exception => e
          __fail ASSERT_NOTHING_RAISED_ERROR, message, {:exception=>e.message}
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
    def assertRaiseExpected exception, pattern, message = nil &block
      __validate_exception pattern, exception
      __assert_block ASSERT_RAISE_EXPECTED_ERROR, message, {:exception=>exception, :pattern=>pattern} do
        e = false
        begin
          yield
        rescue exception => e
          assertEqual pattern, e.message if pattern.is_a? String and pattern.length > 0
          assertMatch pattern, e.message if pattern.is_a? Regexp
        end
        e
      end
    end
  end
end
