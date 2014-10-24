require 'RubyUnit/Assertions'

# Data provider for RubyUnit::Assertions Comparisons tests
require_relative 'data/Comparisons'

module AssertionsTests
  #
  # Test Case for RubyUnit::Assertions Comparisons assertions
  #
  class TC_Comparisons < AssertionsTestCase
    include ComparisonsData

    def assertEqualTest expected, value
      assertEqual expected, value
    end

    def assertEqualFailTest expected, value
      rescue_assertion ASSERT_EQUAL_ERROR do
        assertEqual expected, value
      end
    end

    def assertEqualWithMessageTest expected, value, message
      assertEqual expected, value, message
    end

    def assertEqualWithMessageFailTest expected, value, message
      rescue_assertion ASSERT_EQUAL_ERROR, message do
        assertEqual expected, value, message
      end
    end

    def assertNotEqualTest expected, value
      assertNotEqual expected, value
    end

    def assertNotEqualFailTest expected, value
      rescue_assertion ASSERT_NOT_EQUAL_ERROR do
        assertNotEqual expected, value
      end
    end

    def assertNotEqualWithMessageTest expected, value, message
      assertNotEqual expected, value, message
    end

    def assertNotEqualWithMessageFailTest expected, value, message
      rescue_assertion ASSERT_NOT_EQUAL_ERROR, message do
        assertNotEqual expected, value, message
      end
    end

    def assertGreaterThanTest greater, value
      assertGreaterThan greater, value
    end

    def assertGreaterThanFailTest greater, value
      rescue_assertion ASSERT_GREATERTHAN_ERROR do
        assertGreaterThan greater, value
      end
    end

    def assertGreaterThanWithMessageTest greater, value, message
      assertGreaterThan greater, value, message
    end

    def assertGreaterThanWithMessageFailTest greater, value, message
      rescue_assertion ASSERT_GREATERTHAN_ERROR, message do
        assertGreaterThan greater, value, message
      end
    end

    def assertGreaterThanOrEqualTest greater, value
      assertGreaterThanOrEqual greater, value
    end

    def assertGreaterThanOrEqualFailTest greater, value
      rescue_assertion ASSERT_GREATERTHANOREQUAL_ERROR do
        assertGreaterOrEqualThan greater, value
      end
    end

    def assertGreaterThanOrEqualWithMessageTest greater, value, message
      assertGreaterThanOrEqual greater, value, message
    end

    def assertGreaterThanOrEqualWithMessageFailTest greater, value, message
      rescue_assertion ASSERT_GREATERTHANOREQUAL_ERROR, message do
        assertGreaterOrEqualThan greater, value, message
      end
    end

    def assertLessThanTest less, value
      assertLessThan less, value
    end

    def assertLessThanFailTest less, value
      rescue_assertion ASSERT_LESSTHAN_ERROR do
        assertLessThan less, value
      end
    end

    def assertLessThanWithMessageTest less, value, message
      assertLessThan less, value, message
    end

    def assertLessThanWithMessageFailTest less, value, message
      rescue_assertion ASSERT_LESSTHAN_ERROR, message do
        assertLessThan less, value, message
      end
    end

    def assertLessThanOrEqualTest less, value
      assertLessThanOrEqual less, value
    end

    def assertLessThanOrEqualFailTest less, value
      rescue_assertion ASSERT_LESSTHANOREQUAL_ERROR do
        assertLessThanOrEqual less, value
      end
    end

    def assertLessThanOrEqualWithMessageTest less, value, message
      assertLessThanOrEqual less, value, message
    end

    def assertLessThanOrEqualWithMessageFailTest less, value, message
      rescue_assertion ASSERT_LESSTHANOREQUAL_ERROR, message do
        assertLessThanOrEqual less, value, message
      end
    end

    def assertMatchTest pattern, value
    end

    def assertMatchFailTest pattern, value
    end

    def assertMatchWithMessageTest pattern, value, message
    end

    def assertMatchWithMessageFailTest pattern, value, message
    end

    def assertNotMatchTest pattern, value
    end

    def assertNotMatchFailTest pattern, value
    end

    def assertNotMatchWithMessageTest pattern, value, message
    end

    def assertNotMatchWithMessageFailTest pattern, value, message
    end

    def assertSameTest expected, object
    end

    def assertSameFailTest expected, object
    end

    def assertSameWithMessageTest expected, object, message
    end

    def assertSameWithMessageFailTest expected, object, message
    end

    def assertNotSameTest expected, object
    end

    def assertNotSameFailTest expected, object
    end

    def assertNotSameWithMessageTest expected, object, message
    end

    def assertNotSameWithMessageFailTest expected, object, message
    end
  end
end
