require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Classes'

module AssertionsTests
  ##
  # Test Case for RubyUnit::Assertions Class assertions
  #
  class TC_Classes < AssertionsTestCase
    include ClassesData

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

    ##
    # Test assertDescendent
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    def assertDescendentTest klass, descendent
      assertDescendent klass, descendent
    end

    ##
    # Test assertDescendent failure
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    def assertDescendentFailTest klass, descendent
      rescue_assertion /#{ASSERT_DESCENDENT_ERROR}/ do
        assertDescendent klass, descendent
      end
    end

    ##
    # Test assertDescendent invalid
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    def assertDescendentInvalidTest klass, descendent
      assertRaiseKindOf ArgumentError do
        assertDescendent klass, descendent
      end
    end

    ##
    # Test assertDescendent with message
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertDescendentWithMessageTest klass, descendent, message
      assertDescendent klass, descendent, message
    end

    ##
    # Test assertDescendent failure
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertDescendentWithMessageFailTest klass, descendent, message
      rescue_assertion /#{ASSERT_DESCENDENT_ERROR}/, message do
        assertDescendent klass, descendent, message
      end
    end

    ##
    # Test assertDescendent invalid with message
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertDescendentWithMessageInvalidTest klass, descendent, message
      assertRaiseKindOf ArgumentError, message do
        assertDescendent klass, descendent, message
      end
    end

    ##
    # Test assertNotDescendent
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    def assertNotDescendentTest klass, descendent
      assertNotDescendent klass, descendent
    end

    ##
    # Test assertNotDescendent failure
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    def assertNotDescendentFailTest klass, descendent
      rescue_assertion /#{ASSERT_NOT_DESCENDENT_ERROR}/ do
        assertNotDescendent klass, descendent
      end
    end

    ##
    # Test assertNotDescendent invalid
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    def assertNotDescendentInvalidTest klass, descendent
      assertRaiseKindOf ArgumentError do
        assertNotDescendent klass, descendent
      end
    end

    ##
    # Test assertNotDescendent with message
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertNotDescendentWithMessageTest klass, descendent, message
      assertNotDescendent klass, descendent, message
    end

    ##
    # Test assertNotDescendent failure
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertNotDescendentWithMessageFailTest klass, descendent, message
      rescue_assertion /#{ASSERT_NOT_DESCENDENT_ERROR}/, message do
        assertNotDescendent klass, descendent, message
      end
    end

    ##
    # Test assertNotDescendent invalid with message
    #
    # klass::
    #   Class name for assertion
    #
    # descendent::
    #   Class to be asserted
    #
    # message::
    #   The assertion message
    #
    def assertNotDescendentWithMessageInvalidTest klass, descendent, message
      assertRaiseKindOf ArgumentError, message do
        assertNotDescendent klass, descendent, message
      end
    end
  end
end
