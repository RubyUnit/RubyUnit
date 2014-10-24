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
        assertGreaterThanOrEqual greater, value
      end
    end

    def assertGreaterThanOrEqualWithMessageTest greater, value, message
      assertGreaterThanOrEqual greater, value, message
    end

    def assertGreaterThanOrEqualWithMessageFailTest greater, value, message
      rescue_assertion ASSERT_GREATERTHANOREQUAL_ERROR, message do
        assertGreaterThanOrEqual greater, value, message
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
      assertMatch pattern, value
    end

    def assertMatchFailTest pattern, value
      rescue_assertion ASSERT_MATCH_ERROR do
        assertMatch pattern, value
      end
    end

    def assertMatchWithMessageTest pattern, value, message
      assertMatch pattern, value, message
    end

    def assertMatchWithMessageFailTest pattern, value, message
      rescue_assertion ASSERT_MATCH_ERROR, message do
        assertMatch pattern, value, message
      end
    end

    def assertNotMatchTest pattern, value
      assertNotMatch pattern, value
    end

    def assertNotMatchFailTest pattern, value
      rescue_assertion ASSERT_NOT_MATCH_ERROR do
        assertNotMatch pattern, value
      end
    end

    def assertNotMatchWithMessageTest pattern, value, message
      assertNotMatch pattern, value, message
    end

    def assertNotMatchWithMessageFailTest pattern, value, message
      rescue_assertion ASSERT_NOT_MATCH_ERROR, message do
        assertNotMatch pattern, value, message
      end
    end

    def assertSameTest object
      assertSame object, object
    end

    def assertSameFailTest expected, object
      rescue_assertion ASSERT_SAME_ERROR do
        assertSame expected, object
      end
    end

    def assertSameWithMessageTest object, message
      assertSame object, object, message
    end

    def assertSameWithMessageFailTest expected, object, message
      rescue_assertion ASSERT_SAME_ERROR, message do
        assertSame expected, object, message
      end
    end

    def assertNotSameTest expected, object
      assertNotSame expected, object
    end

    def assertNotSameFailTest object
      rescue_assertion ASSERT_NOT_SAME_ERROR do
        assertNotSame object, object
      end
    end

    def assertNotSameWithMessageTest expected, object, message
      assertNotSame expected, object, message
    end

    def assertNotSameWithMessageFailTest object, message
      rescue_assertion ASSERT_NOT_SAME_ERROR, message do
        assertNotSame object, object, message
      end
    end
  end
end
