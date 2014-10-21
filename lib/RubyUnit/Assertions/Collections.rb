require_relative 'Root'

module RubyUnit
  module Assertions
    module Collections
      include RubyUnit::AssertionMessage
      include Root

      #
      # Assert that a collection includes a specified value
      # * raises RubyUnit::AssertionFailure unless _collection_ responds to _value_
      #
      # collection::
      #   The collection to check
      #
      # value::
      #   The value the object should contain
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertInclude [1, 2], 'not in', 'It does not, so... no'  # => fail
      #
      def assertInclude collection, value, message = nil
        __assert_include ASSERT_INCLUDE_ERROR, collection, value, message do
          collection.include? value
        end
      end

      #
      # Assert that a collection does not include a specified value
      # * raises RubyUnit::AssertionFailure if _collection_ responds to _value_
      #
      # collection::
      #   The collection to check
      #
      # reject::
      #   The value the object should not contain
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertNotInclude [1, 2, 3], 2, 'It does, so close'  # => fail
      #
      def assertNotInclude collection, reject, message = nil
        __assert_include ASSERT_NOT_INCLUDE_ERROR, collection, reject, message do
          not collection.include? reject
        end
      end

      #
      # Assert that a value is empty
      # * raises RubyUnit::AssertionFailure unless _object_ responds to :empty?
      # * raises RubyUnit::AssertionFailure unless _object_ is empty
      #
      # object::
      #   The object to check
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertEmpty [1, 2], 'Not empty'  # => fail
      #
      def assertEmpty object, message = nil
        __assert_empty ASSERT_EMPTY_ERROR, object, message do
          object.empty?
        end
      end

      #
      # Assert that a value is not empty
      # * raises RubyUnit::AssertionFailure unless _object_ responds to :empty?
      # * raises RubyUnit::AssertionFailure if _object_ is empty
      #
      # object::
      #   The object to check
      #
      # message::
      #   The message provided to be reported for a failure
      #
      #  assertNotInclude [1, 2, 3], 2, 'It does, so close'  # => fail
      #
      def assertNotEmpty object, message = nil
        __assert_empty ASSERT_EMPTY_ERROR, object, message do
          not object.empty?
        end
      end

      private
      def __assert_include error, collection, value, message
        raise ArgumentError, "#{collection.class} does not respond to :include?" unless collection.respond_to? :include?
        __assert_block error, message, {:collection=>collection, :value=>value} { yield }
      end

      def __assert_empty error, object, message
        raise ArgumentError, "#{object.class} does not respond to :empty?" unless collection.respond_to? :empty?
        __assert_block error, message, {:object=>object} { yield }
      end
    end
  end
end
