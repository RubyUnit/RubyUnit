require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Basic'

module AssertionsTests
  #
  # Test Case for RubyUnit::Assertions Basic assertions
  #
  class TC_Basic < AssertionsTestCase
    include BasicData

    #
    # Test for default fail
    #
    def defaultFailTest
      rescue_assertion /#{FAILING}/ do
        fail
      end
    end

    #
    # Test fail with message
    #
    # message::
    #   The assertion message
    #
    def failWithMessageTest message
      rescue_assertion /#{FAILING}/, message do
        fail message
      end
    end

    #
    # Test fail with message and data
    #
    # message::
    #   The assertion message
    #
    # data::
    #   The assertion data
    #
    def failWithDataTest message, data = {}
      rescue_assertion /#{FAILING}/, message do
        fail message, data
      end
    end

    #
    # Test assert
    #
    # value::
    #   The value to assert
    #
    def assertTest value
      assert value
    end

    #
    # Test assert failure
    #
    # value::
    #   The value to assert
    #
    def assertFailTest value
      rescue_assertion /#{ASSERT_ERROR}/ do
        assert value
      end
    end

    #
    # Test assert with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertWithMessageTest value, message
      assert value, message
    end

    #
    # Test assert failure with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertFailWithMessageTest value, message
      rescue_assertion /#{ASSERT_ERROR}/, message do
        assert value, message
      end
    end

    #
    # Test assertNot
    #
    # value::
    #   The value to assert
    #
    def assertNotTest value
      assertNot value
    end

    #
    # Test assertNot failure
    #
    # value::
    #   The value to assert
    #
    def assertNotFailTest value
      rescue_assertion /#{ASSERT_NOT_ERROR}/ do
        assertNot value
      end
    end

    #
    # Test assertNot with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertNotWithMessageTest value, message
      assertNot value, message
    end

    #
    # Test assertNot failure with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertNotFailWithMessageTest value, message
      rescue_assertion /#{ASSERT_NOT_ERROR}/, message do
        assertNot value, message
      end
    end

    #
    # Test assertTrue
    #
    # value::
    #   The value to assert
    #
    def assertTrueTest value
      assertTrue value
    end

    #
    # Test assertTrue failure
    #
    # value::
    #   The value to assert
    #
    def assertTrueFailTest value
      rescue_assertion /#{ASSERT_TRUE_ERROR}/ do
        assertTrue value
      end
    end

    #
    # Test assertTrue with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertTrueWithMessageTest value, message
      assertTrue value, message
    end

    #
    # Test assertTrue failure with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertTrueFailWithMessageTest value, message
      rescue_assertion /#{ASSERT_TRUE_ERROR}/, message do
        assertTrue value, message
      end
    end

    #
    # Test assertFalse
    #
    # value::
    #   The value to assert
    #
    def assertFalseTest value
      assertFalse value
    end

    #
    # Test assertFalse failure
    #
    # value::
    #   The value to assert
    #
    def assertFalseFailTest value
      rescue_assertion /#{ASSERT_FALSE_ERROR}/ do
        assertFalse value
      end
    end

    #
    # Test assertFalse with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertFalseWithMessageTest value, message
      assertFalse value, message
    end

    #
    # Test assertFalse failure with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertFalseFailWithMessageTest value, message
      rescue_assertion /#{ASSERT_FALSE_ERROR}/, message do
        assertFalse value, message
      end
    end

    #
    # Test assertNil
    #
    # value::
    #   The value to assert
    #
    def assertNilTest value
      assertNil value
    end

    #
    # Test assertNil failure
    #
    # value::
    #   The value to assert
    #
    def assertNilFailTest value
      rescue_assertion /#{ASSERT_NIL_ERROR}/ do
        assertNil value
      end
    end

    #
    # Test assertNil with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertNilWithMessageTest value, message
      assertNil value, message
    end

    #
    # Test assertNil failure with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertNilFailWithMessageTest value, message
      rescue_assertion /#{ASSERT_NIL_ERROR}/, message do
        assertNil value, message
      end
    end

    #
    # Test assertNotNil
    #
    # value::
    #   The value to assert
    #
    def assertNotNilTest value
      assertNotNil value
    end

    #
    # Test assertNotNil failure
    #
    # value::
    #   The value to assert
    #
    def assertNotNilFailTest value
      rescue_assertion /#{ASSERT_NOT_NIL_ERROR}/ do
        assertNotNil value
      end
    end

    #
    # Test assertNotNil with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertNotNilWithMessageTest value, message
      assertNotNil value, message
    end

    #
    # Test assertNotNil failure with message
    #
    # value::
    #   The value to assert
    #
    # message::
    #   The assertion message
    #
    def assertNotNilFailWithMessageTest value, message
      rescue_assertion /#{ASSERT_NOT_NIL_ERROR}/, message do
        assertNotNil value, message
      end
    end
  end
end
