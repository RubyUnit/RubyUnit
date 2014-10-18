module RubyUnit
  module Assertions
    include AssertionMessage unless included_modules.include? AssertionMessage

    #
    # Assert that a collection includes a specified value
    # * raises RubyUnit::AssertionFailure unless _collection_ responds to _value_
    #
    # object::
    #   The collection to check
    #
    # method::
    #   The value the object should contain
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertInclude [1, 2], 'not in', 'It does not, so... no'  # => fail
    #
    def assertInclude collection, value, message = nil
      assertRespondTo collection, :include?, message
      __assert (collection.include? value), 'Failed to assert collection includes value', message, {:collection=>collection, :value=>value}
    end

    #
    # Assert that a collection does not include a specified value
    # * raises RubyUnit::AssertionFailure if _collection_ responds to _value_
    #
    # object::
    #   The collection to check
    #
    # method::
    #   The value the object should not contain
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertNotInclude [1, 2, 3], 2, 'It does, so close'  # => fail
    #
    def assertNotInclude collection, value, message = nil
      assertRespondTo collection, :include?, message
      __reject (collection.include? value), 'Collection should NOT include value', message, {:collection=>collection, :value=>value}
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
      assertRespondTo object, :include?, message
      __assert object.empty?, 'Failed to assert object is empty', message, {:object=>object}
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
      assertRespondTo object, :include?, message
      __reject object.empty?, 'Failed to assert object is NOT empty', message, {:object=>object}
    end
  end
end
