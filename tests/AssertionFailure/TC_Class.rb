require 'RubyUnit/AssertionFailure'

module AssertionFailureTests
  ##
  # Test Case for RubyUnit::AssertionFailure
  #
  class TC_Class < RubyUnit::TestCase

    ##
    # Validate that RubyUnit::AssertionFailure is an Exception
    #
    def isExceptionTest
      assertDescendent Exception, RubyUnit::AssertionFailure, 'AssertionFailure MUST be an Exception'
    end
  end
end
