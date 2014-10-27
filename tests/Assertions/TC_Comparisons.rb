require 'RubyUnit/Assertions'

# Data provider for RubyUnit::Assertions Comparisons tests
require_relative 'data/Comparisons'

module AssertionsTests
  ##
  # Test Case for RubyUnit::Assertions Comparisons assertions
  #
  class TC_Comparisons < AssertionsTestCase
    include ComparisonsData

    ##
    # Test assertEqualTest
    #
    # expected::
    #   The expected value
    #
    # value::
    #   Value to assert
    #
    def assertEqualTest expected, value
      assertEqual expected, value
    end

    ##
    # Test assertEqualFailTest
    #
    # expected::
    #   The expected value
    #
    # value::
    #   Value to assert
    #
    def assertEqualFailTest expected, value
      rescue_assertion ASSERT_EQUAL_ERROR do
        assertEqual expected, value
      end
    end

    ##
    # Test assertEqualWithMessageTest
    #
    # expected::
    #   The expected value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertEqualWithMessageTest expected, value, message
      assertEqual expected, value, message
    end

    ##
    # Test assertEqualWithMessageFailTest
    #
    # expected::
    #   The expected value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertEqualWithMessageFailTest expected, value, message
      rescue_assertion ASSERT_EQUAL_ERROR, message do
        assertEqual expected, value, message
      end
    end

    ##
    # Test assertNotEqualTest
    #
    # expected::
    #   The expected value
    #
    # value::
    #   Value to assert
    #
    def assertNotEqualTest expected, value
      assertNotEqual expected, value
    end

    ##
    # Test assertNotEqualFailTest
    #
    # expected::
    #   The expected value
    #
    # value::
    #   Value to assert
    #
    def assertNotEqualFailTest expected, value
      rescue_assertion ASSERT_NOT_EQUAL_ERROR do
        assertNotEqual expected, value
      end
    end

    ##
    # Test assertNotEqualWithMessageTest
    #
    # expected::
    #   The expected value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertNotEqualWithMessageTest expected, value, message
      assertNotEqual expected, value, message
    end

    ##
    # Test assertNotEqualWithMessageFailTest
    #
    # expected::
    #   The expected value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertNotEqualWithMessageFailTest expected, value, message
      rescue_assertion ASSERT_NOT_EQUAL_ERROR, message do
        assertNotEqual expected, value, message
      end
    end

    ##
    # Test assertGreaterThanTest
    #
    # greater::
    #   The greater value
    #
    # value::
    #   Value to assert
    #
    def assertGreaterThanTest greater, value
      assertGreaterThan greater, value
    end

    ##
    # Test assertGreaterThanFailTest
    #
    # greater::
    #   The greater value
    #
    # value::
    #   Value to assert
    #
    def assertGreaterThanFailTest greater, value
      rescue_assertion ASSERT_GREATERTHAN_ERROR do
        assertGreaterThan greater, value
      end
    end

    ##
    # Test assertGreaterThanWithMessageTest
    #
    # greater::
    #   The greater value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertGreaterThanWithMessageTest greater, value, message
      assertGreaterThan greater, value, message
    end

    ##
    # Test assertGreaterThanWithMessageFailTest
    #
    # greater::
    #   The greater value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertGreaterThanWithMessageFailTest greater, value, message
      rescue_assertion ASSERT_GREATERTHAN_ERROR, message do
        assertGreaterThan greater, value, message
      end
    end

    ##
    # Test assertGreaterThanOrEqualTest
    #
    # greater::
    #   The greater value
    #
    # value::
    #   Value to assert
    #
    def assertGreaterThanOrEqualTest greater, value
      assertGreaterThanOrEqual greater, value
    end

    ##
    # Test assertGreaterThanOrEqualFailTest
    #
    # greater::
    #   The greater value
    #
    # value::
    #   Value to assert
    #
    def assertGreaterThanOrEqualFailTest greater, value
      rescue_assertion ASSERT_GREATERTHANOREQUAL_ERROR do
        assertGreaterThanOrEqual greater, value
      end
    end

    ##
    # Test assertGreaterThanOrEqualWithMessageTest
    #
    # greater::
    #   The greater value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertGreaterThanOrEqualWithMessageTest greater, value, message
      assertGreaterThanOrEqual greater, value, message
    end

    ##
    # Test assertGreaterThanOrEqualWithMessageFailTest
    #
    # greater::
    #   The greater value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertGreaterThanOrEqualWithMessageFailTest greater, value, message
      rescue_assertion ASSERT_GREATERTHANOREQUAL_ERROR, message do
        assertGreaterThanOrEqual greater, value, message
      end
    end

    ##
    # Test assertLessThanTest
    #
    # lesser::
    #   The lesser value
    #
    # value::
    #   Value to assert
    #
    def assertLessThanTest lesser, value
      assertLessThan lesser, value
    end

    ##
    # Test assertLessThanFailTest
    #
    # lesser::
    #   The lesser value
    #
    # value::
    #   Value to assert
    #
    def assertLessThanFailTest lesser, value
      rescue_assertion ASSERT_LESSTHAN_ERROR do
        assertLessThan lesser, value
      end
    end

    ##
    # Test assertLessThanWithMessageTest
    #
    # lesser::
    #   The lesser value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertLessThanWithMessageTest lesser, value, message
      assertLessThan lesser, value, message
    end

    ##
    # Test assertLessThanWithMessageFailTest
    #
    # lesser::
    #   The lesser value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertLessThanWithMessageFailTest lesser, value, message
      rescue_assertion ASSERT_LESSTHAN_ERROR, message do
        assertLessThan lesser, value, message
      end
    end

    ##
    # Test assertLessThanOrEqualTest
    #
    # lesser::
    #   The lesser value
    #
    # value::
    #   Value to assert
    #
    def assertLessThanOrEqualTest lesser, value
      assertLessThanOrEqual lesser, value
    end

    ##
    # Test assertLessThanOrEqualFailTest
    #
    # lesser::
    #   The lesser value
    #
    # value::
    #   Value to assert
    #
    def assertLessThanOrEqualFailTest lesser, value
      rescue_assertion ASSERT_LESSTHANOREQUAL_ERROR do
        assertLessThanOrEqual lesser, value
      end
    end

    ##
    # Test assertLessThanOrEqualWithMessageTest
    #
    # lesser::
    #   The lesser value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertLessThanOrEqualWithMessageTest lesser, value, message
      assertLessThanOrEqual lesser, value, message
    end

    ##
    # Test assertLessThanOrEqualWithMessageFailTest
    #
    # lesser::
    #   The lesser value
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertLessThanOrEqualWithMessageFailTest lesser, value, message
      rescue_assertion ASSERT_LESSTHANOREQUAL_ERROR, message do
        assertLessThanOrEqual lesser, value, message
      end
    end

    ##
    # Test assertMatchTest
    #
    # pattern::
    #   The pattern to check against
    #
    # value::
    #   Value to assert
    #
    def assertMatchTest pattern, value
      assertMatch pattern, value
    end

    ##
    # Test assertMatchFailTest
    #
    # pattern::
    #   The pattern to check against
    #
    # value::
    #   Value to assert
    #
    def assertMatchFailTest pattern, value
      rescue_assertion ASSERT_MATCH_ERROR do
        assertMatch pattern, value
      end
    end

    ##
    # Test assertMatchWithMessageTest
    #
    # pattern::
    #   The pattern to check against
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertMatchWithMessageTest pattern, value, message
      assertMatch pattern, value, message
    end

    ##
    # Test assertMatchWithMessageFailTest
    #
    # pattern::
    #   The pattern to check against
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertMatchWithMessageFailTest pattern, value, message
      rescue_assertion ASSERT_MATCH_ERROR, message do
        assertMatch pattern, value, message
      end
    end

    ##
    # Test assertNotMatchTest
    #
    # pattern::
    #   The pattern to check against
    #
    # value::
    #   Value to assert
    #
    def assertNotMatchTest pattern, value
      assertNotMatch pattern, value
    end

    ##
    # Test assertNotMatchFailTest
    #
    # pattern::
    #   The pattern to check against
    #
    # value::
    #   Value to assert
    #
    def assertNotMatchFailTest pattern, value
      rescue_assertion ASSERT_NOT_MATCH_ERROR do
        assertNotMatch pattern, value
      end
    end

    ##
    # Test assertNotMatchWithMessageTest
    #
    # pattern::
    #   The pattern to check against
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertNotMatchWithMessageTest pattern, value, message
      assertNotMatch pattern, value, message
    end

    ##
    # Test assertNotMatchWithMessageFailTest
    #
    # pattern::
    #   The pattern to check against
    #
    # value::
    #   Value to assert
    #
    # message::
    #   The assertion message
    #
    def assertNotMatchWithMessageFailTest pattern, value, message
      rescue_assertion ASSERT_NOT_MATCH_ERROR, message do
        assertNotMatch pattern, value, message
      end
    end

    ##
    # Test assertSameTest
    #
    # object::
    #   The object to check
    #
    def assertSameTest object
      assertSame object, object
    end

    ##
    # Test assertSameFailTest
    #
    # expected::
    #   The expected object to check against
    #
    # object::
    #   The object to check
    #
    def assertSameFailTest expected, object
      rescue_assertion ASSERT_SAME_ERROR do
        assertSame expected, object
      end
    end

    ##
    # Test assertSameWithMessageTest
    #
    # object::
    #   The object to check
    #
    # message::
    #   The assertion message
    #
    def assertSameWithMessageTest object, message
      assertSame object, object, message
    end

    ##
    # Test assertSameWithMessageFailTest
    #
    # expected::
    #   The expected object to check against
    #
    # object::
    #   The object to check
    #
    # message::
    #   The assertion message
    #
    def assertSameWithMessageFailTest expected, object, message
      rescue_assertion ASSERT_SAME_ERROR, message do
        assertSame expected, object, message
      end
    end

    ##
    # Test assertNotSameTest
    #
    # expected::
    #   The expected object to check against
    #
    # object::
    #   The object to check
    #
    def assertNotSameTest expected, object
      assertNotSame expected, object
    end

    ##
    # Test assertNotSameFailTest
    #
    # object::
    #   The object to check
    #
    def assertNotSameFailTest object
      rescue_assertion ASSERT_NOT_SAME_ERROR do
        assertNotSame object, object
      end
    end

    ##
    # Test assertNotSameWithMessageTest
    #
    # expected::
    #   The expected object to check against
    #
    # object::
    #   The object to check
    #
    # message::
    #   The assertion message
    #
    def assertNotSameWithMessageTest expected, object, message
      assertNotSame expected, object, message
    end

    ##
    # Test assertNotSameWithMessageFailTest
    #
    # object::
    #   The object to check
    #
    # message::
    #   The assertion message
    #
    def assertNotSameWithMessageFailTest object, message
      rescue_assertion ASSERT_NOT_SAME_ERROR, message do
        assertNotSame object, object, message
      end
    end
  end
end
