require 'RubyUnit/AssertionFailure'

##
# Data provider for RubyUnit::AssertionFailure tests
require_relative 'data/Class'

module AssertionFailureTests
  ##
  # Test Case for RubyUnit::AssertionFailure
  #
  class TC_Class < RubyUnit::TestCase
    include ClassData

    ##
    # Validate that RubyUnit::AssertionFailure has the correct super classes
    #
    def isDescendentTest e
      assertDescendent e, RubyUnit::AssertionFailure, 'AssertionFailure MUST be an Exception'
    end
  end
end
