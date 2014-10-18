require 'RubyUnit/AssertionFailure'

# Data provider for RubyUnit::AssertionFailure tests
require_relative 'data/Class'

module AssertionFailureTests
  #
  # Test Case for RubyUnit::AssertionFailure
  #
  class TC_Class < RubyUnit::TestCase
    include ClassTestsData

    #
    # Validate that RubyUnit::AssertionFailure is an Exception
    #
    def isExceptionTest
      assertDescendent Exception, RubyUnit::AssertionFailure, 'AssertionFailure MUST be an Exception'
    end

    #
    # Assert all required constants are defined
    #
    def constantTest konstant
      assertConstDefined RubyUnit::AssertionFailure, konstant, 'Required constant is missing'
    end
  end
end
