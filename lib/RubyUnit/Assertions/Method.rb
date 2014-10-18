module RubyUnit
  module Assertions
    include AssertionMessage

    #
    # Assert that an object responds to particular method
    # * raises RubyUnit::AssertionFailure unless _object_ responds to _method_
    #
    # object::
    #   The object to check
    #
    # method::
    #   The method to assert on the object
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertRespondTo /^Regexp/, :length, 'It does not, so... no'  # => fail
    #
    def assertRespondTo object, method, message = nil
      __assert (object.respond_to? method), 'Failed to assert object responds to method', message, {:object=>object, :method=>method}
    end

    #
    # Assert that an object does not respond to a particular method
    # * raises RubyUnit::AssertionFailure if _object_ responds to _method_
    #
    # object::
    #   The object to check
    #
    # method::
    #   The method to assert on the object
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertNotRespondTo 25, :integer?, 'It does, so close'  # => fail
    #
    def assertNotRespondTo object, method, message = nil
      __assert (object.respond_to? method), 'Object should NOT respond to method', message, {:object=>object, :method=>method}
    end

    #
    # Assert that an object has defined the specified method.
    # * raises RubyUnit::AssertionFailure unless _klass_ has defined _method_
    #
    # klass::
    #   The object to check for _method_
    #
    # method::
    #   The method to check
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertMethod String, :integer?, 'Nope' # => fail
    #
    def assertMethod klass, method, message = nil
      assertInclude klass.methods, method, message
    end

    #
    # Assert that an object has not defined the specified method.
    # * raises RubyUnit::AssertionFailure if _klass_ has defined _method_
    #
    # klass::
    #   The object to check for _method_
    #
    # method::
    #   The method to check
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertNotMethod Integer, :integer?, 'Nope' # => fail
    #
    def assertNotMethod klass, not_method, message = nil
      assertNotInclude klass.methods, not_method, message
    end

    #
    # Assert that an object has defined the specified instance method.
    # * raises RubyUnit::AssertionFailure unless _klass_ has defined _instance_method_
    #
    # klass::
    #   The object to check for _instance_method_
    #
    # method::
    #   The method to check
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertInstanceMethod String, :integer?, 'Nope' # => fail
    #
    def assertInstanceMethod klass, instance_method, message = nil
      assertInclude klass.instance_methods, instance_method, message
    end

    #
    # Assert that an object has not defined the specified instance method.
    # * raises RubyUnit::AssertionFailure unless _klass_ has defined _not_instance_method_
    #
    # klass::
    #   The object to check for _not_instance_method_
    #
    # method::
    #   The method to check
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertNotInstanceMethod Integer, :integer?, 'Nope' # => fail
    #
    def assertNotInstanceMethod klass, not_instance_method, message = nil
      assertNotInclude klass.instance_methods, not_instance_method, message
    end

    #
    # Assert that an Class has defined the specified class method.
    # * raises RubyUnit::AssertionFailure unless _klass_ has defined _class_method_
    #
    # klass::
    #   The object to check for _class_method_
    #
    # method::
    #   The method to check
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertClassMethod String, :integer?, 'Nope' # => fail
    #
    def assertClassMethod klass, class_method, message = nil
      assertInclude klass.singleton_methods, class_method, message
    end

    #
    # Assert that an Class has not defined the specified class method.
    # * raises RubyUnit::AssertionFailure unless _klass_ has defined _not_class_method_
    #
    # klass::
    #   The object to check for _not_class_method_
    #
    # method::
    #   The method to check
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertNotClassMethod String, :new, 'Nope' # => fail
    #
    def assertNotClassMethod klass, not_class_method, message = nil
      assertNotInclude klass.singleton_methods, not_class_method, message
    end
  end
end
