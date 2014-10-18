require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Basic'

module AssertionsTests
  #
  # Test Case for RubyUnit::Assertions module
  #
  class TC_Basic < AssertionsTestCase
    include BasicTestsData
    @assertions

    #
    # Test for default fail
    #
    def failTest message = nil, data = {}
      rescue_assertion /#{RubyUnit::AssertionFailure::FAILING}/, message, data do
        fail message, data
      end
    end

    #
    # Test fail with message
    #
    def failWithMessageTest data = {}
      failTest MESSAGE, data
    end

    #
    # Test assert
    #
    def assertTest value
      assert value
    end

    #
    # Test assert failure
    #
    def assertFailTest value, message = nil
      rescue_assertion /#{RubyUnit::AssertionFailure::ASSERT_ERROR}/, message do
        assert value, message
      end
    end

    #
    # Test assert with message
    #
    def assertMessageTest value
      assert value, MESSAGE
    end

    #
    # Test assert failure with message
    #
    def assertFailWithMessageTest value
      assertFailTest value, MESSAGE
    end

    #
    # Test assertNot
    #
    def assertNotTest value
      assertNot value
    end

    #
    # Test assertNot failure
    #
    def assertNotFailTest value, message = nil
      rescue_assertion /#{RubyUnit::AssertionFailure::ASSERT_NOT_ERROR}/, message do
        assertNot value, message
      end
    end

    #
    # Test assertNot with message
    #
    def assertNotWithMessageTest value
      assertNot value, MESSAGE
    end

    #
    # Test assertNot failure with message
    #
    def assertNotFailWithMessageTest value
      assertNotFailTest value, MESSAGE
    end

    #
    # Test assertTrue
    #
    def assertTrueTest value
      assertTrue value
    end

    #
    # Test assertTrue failure
    #
    def assertTrueFailTest value, message = nil
      rescue_assertion /#{RubyUnit::AssertionFailure::ASSERT_TRUE_ERROR}/, message do
        assertTrue value, message
      end
    end

    #
    # Test assertTrue with message
    #
    def assertTrueWithMessageTest value
      assertTrue value, MESSAGE
    end

    #
    # Test assertTrue failure with message
    #
    def assertTrueFailWithMessageTest value
      assertTrueFailTest value, MESSAGE
    end

    #
    # Test assertFalse
    #
    def assertFalseTest value
      assertFalse value
    end

    #
    # Test assertFalse failure
    #
    def assertFalseFailTest value, message = nil
      rescue_assertion /#{RubyUnit::AssertionFailure::ASSERT_FALSE_ERROR}/, message do
        assertFalse value, message
      end
    end

    #
    # Test assertFalse with message
    #
    def assertFalseWithMessageTest value
      assertFalse value, MESSAGE
    end

    #
    # Test assertFalse failure with message
    #
    def assertFalseFailWithMessageTest value
      assertFalseFailTest value, MESSAGE
    end
  end
end
