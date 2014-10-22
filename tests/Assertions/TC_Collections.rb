require 'RubyUnit/Assertions'

# Data provider for RubyUnit::Assertions Collections tests
require_relative 'data/Collections'

module AssertionsTests
  ##
  # Test Case for RubyUnit::Assertions Collections assertions
  #
  class TC_Collections < AssertionsTestCase
    include CollectionsData

    ##
    # Test assertInclude
    #
    # collection::
    #   Collection for assertion
    #
    # value::
    #   Value to assert
    #
    def assertIncludeTest collection, value
      assertInclude collection, value
    end

    ##
    # Test assertInclude failure
    #
    # collection::
    #   Collection for assertion
    #
    # value::
    #   Value to assert
    #
    def assertIncludeFailTest collection, value
      rescue_assertion /#{ASSERT_INCLUDE_ERROR}/ do
        assertInclude collection, value
      end
    end

    ##
    # Test assertInclude invalid
    #
    # collection::
    #   Collection for assertion
    #
    # value::
    #   Value to assert
    #
    def assertIncludeInvalidTest collection, value
      assertRaiseKindOf ArgumentError do
        assertInclude collection, value
      end
    end

    ##
    # Test assertInclude with message
    #
    # collection::
    #   Collection for assertion
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertIncludeWithMessageTest collection, value, message
      assertInclude collection, value, message
    end

    ##
    # Test assertInclude failure
    #
    # collection::
    #   Collection for assertion
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertIncludeWithMessageFailTest collection, value, message
      rescue_assertion /#{ASSERT_INCLUDE_ERROR}/, message do
        assertInclude collection, value, message
      end
    end

    ##
    # Test assertInclude invalid with message
    #
    # collection::
    #   Collection for assertion
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertIncludeWithMessageInvalidTest collection, value, message
      assertRaiseKindOf ArgumentError, message do
        assertInclude collection, value, message
      end
    end

    ##
    # Test assertNotInclude
    #
    # collection::
    #   Collection for assertion
    #
    # value::
    #   Value to assert
    #
    def assertNotIncludeTest collection, value
      assertNotInclude collection, value
    end

    ##
    # Test assertNotInclude failure
    #
    # collection::
    #   Collection for assertion
    #
    # value::
    #   Value to assert
    #
    def assertNotIncludeFailTest collection, value
      rescue_assertion /#{ASSERT_NOT_INCLUDE_ERROR}/ do
        assertNotInclude collection, value
      end
    end

    ##
    # Test assertNotInclude invalid
    #
    # collection::
    #   Collection for assertion
    #
    # value::
    #   Value to assert
    #
    def assertNotIncludeInvalidTest collection, value
      assertRaiseKindOf ArgumentError do
        assertNotInclude collection, value
      end
    end

    ##
    # Test assertNotInclude with message
    #
    # collection::
    #   Collection for assertion
    #
    # message::
    #   The assertion message
    #
    # value::
    #   Value to assert
    #
    def assertNotIncludeWithMessageTest collection, value, message
      assertNotInclude collection, value, message
    end

    ##
    # Test assertNotInclude failure
    #
    # collection::
    #   Collection for assertion
    #
    # message::
    #   The assertion message
    #
    # value::
    #   Value to assert
    #
    def assertNotIncludeWithMessageFailTest collection, value, message
      rescue_assertion /#{ASSERT_NOT_INCLUDE_ERROR}/, message do
        assertNotInclude collection, value, message
      end
    end

    ##
    # Test assertNotInclude invalid with message
    #
    # collection::
    #   Collection for assertion
    #
    # message::
    #   The assertion message
    #
    # value::
    #   Value to assert
    #
    def assertNotIncludeWithMessageInvalidTest collection, value, message
      assertRaiseKindOf ArgumentError, message do
        assertNotInclude collection, value, message
      end
    end









    ##
    # Test assertEmpty
    #
    # collection::
    #   Collection for assertion
    #
    def assertEmptyTest collection
      assertEmpty collection
    end

    ##
    # Test assertEmpty failure
    #
    # collection::
    #   Collection for assertion
    #
    def assertEmptyFailTest collection
      rescue_assertion /#{ASSERT_EMPTY_ERROR}/ do
        assertEmpty collection
      end
    end

    ##
    # Test assertEmpty invalid
    #
    # collection::
    #   Collection for assertion
    #
    def assertEmptyInvalidTest collection
      assertRaiseKindOf ArgumentError do
        assertEmpty collection
      end
    end

    ##
    # Test assertEmpty with message
    #
    # collection::
    #   Collection for assertion
    #
    # message::
    #   The assertion message
    #
    def assertEmptyWithMessageTest collection, message
      assertEmpty collection, message
    end

    ##
    # Test assertEmpty failure
    #
    # collection::
    #   Collection for assertion
    #
    # message::
    #   The assertion message
    #
    def assertEmptyWithMessageFailTest collection, message
      rescue_assertion /#{ASSERT_EMPTY_ERROR}/, message do
        assertEmpty collection, message
      end
    end

    ##
    # Test assertEmpty invalid with message
    #
    # collection::
    #   Collection for assertion
    #
    # message::
    #   The assertion message
    #
    def assertEmptyWithMessageInvalidTest collection, message
      assertRaiseKindOf ArgumentError, message do
        assertEmpty collection, message
      end
    end

    ##
    # Test assertNotEmpty
    #
    # collection::
    #   Collection for assertion
    #
    def assertNotEmptyTest collection
      assertNotEmpty collection
    end

    ##
    # Test assertNotEmpty failure
    #
    # collection::
    #   Collection for assertion
    #
    def assertNotEmptyFailTest collection
      rescue_assertion /#{ASSERT_NOT_EMPTY_ERROR}/ do
        assertNotEmpty collection
      end
    end

    ##
    # Test assertNotEmpty invalid
    #
    # collection::
    #   Collection for assertion
    #
    def assertNotEmptyInvalidTest collection
      assertRaiseKindOf ArgumentError do
        assertNotEmpty collection
      end
    end

    ##
    # Test assertNotEmpty with message
    #
    # collection::
    #   Collection for assertion
    #
    # message::
    #   The assertion message
    #
    def assertNotEmptyWithMessageTest collection, message
      assertNotEmpty collection, message
    end

    ##
    # Test assertNotEmpty failure
    #
    # collection::
    #   Collection for assertion
    #
    # message::
    #   The assertion message
    #
    def assertNotEmptyWithMessageFailTest collection, message
      rescue_assertion /#{ASSERT_NOT_EMPTY_ERROR}/, message do
        assertNotEmpty collection, message
      end
    end

    ##
    # Test assertNotEmpty invalid with message
    #
    # collection::
    #   Collection for assertion
    #
    # message::
    #   The assertion message
    #
    def assertNotEmptyWithMessageInvalidTest collection, message
      assertRaiseKindOf ArgumentError, message do
        assertNotEmpty collection, message
      end
    end
  end
end
