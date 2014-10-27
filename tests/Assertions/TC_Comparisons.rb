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
    # Test assertEqual
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
    # Test assertEqual failure
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
    # Test assertEqual with message
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
    # Test assertEqual with message failure
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
    # Test assertNotEqual
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
    # Test assertNotEqual failure
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
    # Test assertNotEqual with message
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
    # Test assertNotEqual with message failure
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
    # Test assertGreaterThan
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
    # Test assertGreaterThan failure
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
    # Test assertGreaterThan with message
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
    # Test assertGreaterThan with message failure
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
    # Test assertGreaterThanOrEqual
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
    # Test assertGreaterThanOrEqual failure
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
    # Test assertGreaterThanOrEqual with message
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
    # Test assertGreaterThanOrEqual with message failure
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
    # Test assertLessThan
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
    # Test assertLessThan failure
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
    # Test assertLessThan with message
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
    # Test assertLessThan with message failure
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
    # Test assertLessThanOrEqual
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
    # Test assertLessThanOrEqual failure
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
    # Test assertLessThanOrEqual with message
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
    # Test assertLessThanOrEqual with message failure
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
    # Test assertMatch
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
    # Test assertMatch failure
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
    # Test assertMatch with message
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
    # Test assertMatch with message failure
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
    # Test assertNotMatch
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
    # Test assertNotMatch failure
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
    # Test assertNotMatch with message
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
    # Test assertNotMatch with message failure
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
    # Test assertSame
    #
    # object::
    #   The object to check
    #
    def assertSameTest object
      assertSame object, object
    end

    ##
    # Test assertSame failure
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
    # Test assertSame with message
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
    # Test assertSame with message failure
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
    # Test assertNotSame
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
    # Test assertNotSame failure
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
    # Test assertNotSame with message
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
    # Test assertNotSame with message failure
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
