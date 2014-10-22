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
