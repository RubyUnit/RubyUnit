module RubyUnit
  module Assertions
    include AssertionMessage
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
      __assert (object.is_a? klass), ASSERT_KIND_OF_ERROR, message, {:klass=>klass, :object=>object}
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
      __reject (object.is_a? exclusion), ASSERT_NOT_KIND_OF_ERROR, message, {:exclusion=>exclusion, :object=>object}
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
      __assert (object.instance_of? klass), ASSERT_INSTANCE_OF_ERROR, message, {:klass=>klass, :object=>object}
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
      __reject (object.instance_of? exclusion), ASSERT_NOT_INSTANCE_OF_ERROR, message, {:exclusion=>exclusion, :object=>object}
    end

    #
    # Assert that a class is a descendent of another class
    # * raises RubyUnit::AssertionFailure unless _descendent_ is a descendent of +_super+
    #
    # _super::
    #   The parent class
    #
    # descendent::
    #   The descendent class
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertDescendent Numeric, Exception, 'Nope'  # => fail
    #
    def assertDescendent _super, descendent, message = nil
      __validate_arguments [Class], [_super]
      __assert (descendent < _super), ASSERT_DESCENDENT_ERROR, message, {:class=>_super, :descendent=>descendent}
    end

    #
    # Assert that a class is not a descendent of another class
    # * raises RubyUnit::AssertionFailure if _klass_ is a descendent of _klass_
    #
    # klass::
    #   The parent class
    #
    # descendent::
    #   The illegal descendent class
    #
    # message::
    #   The message provided to be reported for a failure
    #
    #  assertDescendent StandardError, Exception, 'It is'  # => fail
    #
    def assertNotDescendent klass, descendent, message = nil
      __validate_arguments [Class], [klass]
      __reject (descendent < klass), ASSERT_NOT_DESCENDENT_ERROR, message, {:klass=>klass, :descendent=>descendent}
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
      __assert_block ASSERT_CONST_ERROR, message do
        assertConstDefined klass, konstant, message
        value = klass.const_get konstant
        assertKindOf expected.class, value, message
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
      __assert (klass.const_defined? konstant), ASSERT_CONST_DEFINED_ERROR, message, {:klass=>klass, :konstant=>konstant}
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
      __reject (klass.const_defined? konstant), ASSERT_CONST_NOT_DEFINED_ERROR, message, {:klass=>klass, :konstant=>konstant}
    end
  end
end
