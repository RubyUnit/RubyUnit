module RubyUnit
  #
  # Assertions that can be used by RubyUnit::TestCase
  #
  module Assertions
    include AssertionMessage

    # Tracks the total number of assertions made during the tests
    @@assertions = 0

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
      raise AssertionFailure.new({'Assertion Failure'=>message}.merge data), error
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
    def __validate_exception pattern, e = Exception # :nodoc:
      raise ArgumentError, 'Exception message must be a Regexp or String' unless pattern.is_a? Regexp or pattern.is_a? String
      raise ArgumentError, 'Exception must be a subclass of Exception' unless e < Exception
    end

    def __validate_arguments klasses, objects
      klasses.product(objects) do |klass, object|
        raise ArgumentError, "Expecting #{klass}, Got #{object}" unless object.is_a? klass
      end
    end
  end
end

require_relative 'Assertions/Basic'      # Basic assertions
require_relative 'Assertions/Class'      # Class assertions
require_relative 'Assertions/Collection' # Collection assertions
require_relative 'Assertions/Comparison' # Comparison assertions
require_relative 'Assertions/Exception'  # Exception assertions
require_relative 'Assertions/Method'     # Method assertions
