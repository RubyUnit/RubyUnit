require_relative 'Root'

module RubyUnit
  module Assertions
    module Exceptions
      include RubyUnit::AssertionMessage
      include Root
    
      ##
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

      ##
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
        __assert_exception ASSERT_RAISE_MESSAGE_ERROR, Exception, pattern, message, &block
      end

      ##
      # Assert that a specified exception type is raised.
      # * raises RubyUnit::AssertionFailure unless the correct Exception type is raised
      #
      # exception::
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
      def assertRaiseKindOf exception, message = nil, &block
        __assert_exception ASSERT_RAISE_KIND_OF_ERROR, exception, '', message, &block
      end

      ##
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
        __assert_exception ASSERT_RAISE_EXPECTED_ERROR, exception, pattern, message, &block
      end

      private
      ##
      # Validate the parameters for exception assertions
      # * raises TypeError if _pattern_ is not a String or Regexp
      # * raises TypeError unless _e_ is a descendent of the Exception class
      #
      # pattern:
      #   The regular expression which validates the exception message
      #
      # exception:
      #   The exception type that is expected to be raised
      #
      # message:
      #   The message provided to be reported for a failure
      #
      def __validate_exception pattern, exception = Exception # :nodoc:
        raise TypeError, "Expected subclass of Exception, got #{e.class}" unless exception <= Exception
        regex = pattern
        if pattern.is_a? String
          regex = pattern.length.zero? ? /#{pattern}/ : /^#{pattern}$/
        elsif not pattern.is_a? Regexp
          raise TypeError, "Message pattern must be a Regexp or String, got #{pattern.class}"
        end
        regex
      end

      ##
      # Common method to get catch exceptions and build error message
      #
      # error:
      #   The error message for the current assertion
      #
      # exception:
      #   The exception type that is expected to be raised
      #
      # pattern:
      #   The regular expression which validates the exception message
      #
      # message:
      #   The message provided to be reported for a failure
      #
      def __assert_exception error, exception, pattern, message = nil, &block # :nodoc:
        pattern = __validate_exception pattern, exception
        Assertions.add_assertion
        errors  = []
        failure = false
        begin
          yield
          errors << ASSERT_RAISE_ERROR
        rescue exception => failure
          errors << ASSERT_RAISE_MESSAGE_ERROR unless pattern =~ failure.message
        rescue => failure
          errors << ASSERT_RAISE_KIND_OF_ERROR
        else
          errors.unshift error unless errors.count.zero?
        end
        __fail errors.join("\n"), message, {:exception=>exception, :pattern=>pattern, :raised=>failure, :trace=>failure.backtrace.first} unless errors.count.zero?
        failure
      end
    end
  end
end
