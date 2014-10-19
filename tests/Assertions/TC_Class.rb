require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Class'

module AssertionsTests
  ##
  # Test Case for RubyUnit::Assertions Class assertions
  #
  class TC_Class < AssertionsTestCase
    include ClassData

    ##
    # Test assertKindOf
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    def assertKindOfTest klass, object
      assertKindOf klass, object
    end

    ##
    # Test assertKindOf failure
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    def assertKindOfFailTest klass, object
      rescue_assertion /#{ASSERT_KIND_OF_ERROR}/ do
        assertKindOf klass, object
      end
    end

    ##
    # Test assertKindOf invalid
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    def assertKindOfInvalidTest klass, object
      assertRaiseKindOf TypeError do
        assertKindOf klass, object
      end
    end

    ##
    # Test assertKindOf with message
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertKindOfWithMessageTest klass, object, message
      assertKindOf klass, object, message
    end

    ##
    # Test assertKindOf failure
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertKindOfWithMessageFailTest klass, object, message
      rescue_assertion /#{ASSERT_KIND_OF_ERROR}/, message do
        assertKindOf klass, object, message
      end
    end

    ##
    # Test assertKindOf invalid with message
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertKindOfWithMessageInvalidTest klass, object, message
      assertRaiseKindOf TypeError, message do
        assertKindOf klass, object, message
      end
    end

    ##
    # Test assertInstanceOf
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    def assertInstanceOfTest klass, object
      assertInstanceOf klass, object
    end

    ##
    # Test assertInstanceOf failure
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    def assertInstanceOfFailTest klass, object
      rescue_assertion /#{ASSERT_INSTANCE_OF_ERROR}/ do
        assertInstanceOf klass, object
      end
    end

    ##
    # Test assertInstanceOf invalid
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    def assertInstanceOfInvalidTest klass, object
      assertRaiseKindOf TypeError do
        assertInstanceOf klass, object
      end
    end

    ##
    # Test assertInstanceOf with message
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertInstanceOfWithMessageTest klass, object, message
      assertInstanceOf klass, object, message
    end

    ##
    # Test assertInstanceOf failure
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertInstanceOfWithMessageFailTest klass, object, message
      rescue_assertion /#{ASSERT_INSTANCE_OF_ERROR}/, message do
        assertInstanceOf klass, object, message
      end
    end

    ##
    # Test assertInstanceOf invalid with message
    #
    # klass::
    #   Class name for assertion
    #
    # object::
    #   Object to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertInstanceOfWithMessageInvalidTest klass, object, message
      assertRaiseKindOf TypeError, message do
        assertInstanceOf klass, object, message
      end
    end
  end
end
