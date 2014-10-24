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
    end

    def assertEqualFailTest expected, value
    end

    def assertEqualWithMessageTest expected, value, message
    end

    def assertEqualWithMessageFailTest expected, value, message
    end

    def assertNotEqualTest expected, value
    end

    def assertNotEqualFailTest expected, value
    end

    def assertNotEqualWithMessageTest expected, value, message
    end

    def assertNotEqualWithMessageFailTest expected, value, message
    end

    def assertGreaterThanTest expected, value
    end

    def assertGreaterThanFailTest expected, value
    end

    def assertGreaterThanWithMessageTest expected, value, message
    end

    def assertGreaterThanWithMessageFailTest expected, value, message
    end

    def assertGreaterThanOrEqualTest expected, value
    end

    def assertGreaterThanOrEqualFailTest expected, value
    end

    def assertGreaterOrThanEqualWithMessageTest expected, value, message
    end

    def assertGreaterThanOrEqualWithMessageFailTest expected, value, message
    end

    def assertLessThanTest expected, value
    end

    def assertLessThanFailTest expected, value
    end

    def assertLessThanWithMessageTest expected, value, message
    end

    def assertLessThanWithMessageFailTest expected, value, message
    end

    def assertLessThanOrEqualTest expected, value
    end

    def assertLessThanOrEqualFailTest expected, value
    end

    def assertLessThanOrEqualWithMessageTest expected, value, message
    end

    def assertLessThanOrEqualWithMessageFailTest expected, value, message
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
