module RubyUnit
  module Assertions
    include AssertionMessage
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
      __validate_responds [:include?], collection
      __assert (collection.include? value), ASSERT_INCLUDE_ERROR, message, {:collection=>collection, :value=>value}
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
      __validate_responds [:include?], collection
      __reject (collection.include? reject), ASSERT_NOT_INCLUDE_ERROR, message, {:collection=>collection, :reject=>reject}
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
      __validate_responds [:empty?], collection
      __assert object.empty?, ASSERT_EMPTY_ERROR, message, {:object=>object}
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
      __validate_responds [:empty?], collection
      __reject object.empty?, ASSERT_NOT_EMPTY_ERROR, message, {:object=>object}
    end
  end
end
