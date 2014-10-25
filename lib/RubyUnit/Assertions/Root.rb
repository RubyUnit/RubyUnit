module RubyUnit
  module Assertions
    module Root
      private
      ##
      # Builds the message that will be used with the assertion
      # * raises RubyUnit::AssertionFailure
      # * raises TypeError unless error is a String
      # * raises TypeError unless message is nil or a String
      # * raises TypeError unless data is a Hash
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
      #  __fail 'Failing Test', message, {'expected' => expected, 'actual' => actual }
      #
      def __fail error, message, data = {} # :nodoc:
        raise TypeError, 'Error description must be a String' unless error.is_a? String
        raise TypeError, 'Failure message must be String' unless message.nil? or message.is_a? String
        raise TypeError, 'Failure data must be a Hash' unless data.is_a? Hash
        raise AssertionFailure.new({'Assertion Failure'=>message}.merge data), error
      end

      ##
      # The assertion wrapper is responsible for doing everything that must be done
      # on each assertion.
      # * keep track of the total number of assertions
      #
      # &block::
      #   The assertion which is being wrapped
      #
      def __assert_block error = '', message = nil, data = {} # :nodoc:
        Assertions.add_assertion
        result = block_given? ? yield : false
        __fail error, message, data unless result
        result
      end

      ##
      # This is now a wrapper for __assert_block so it can be called 'nicely' in one line
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
        __assert_block error, message, data do
          # this will result in returning true if an Exception is not raised
          value
        end
      end

      ##
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
        __assert !value, error, message, data
      end
    end
  end
end
