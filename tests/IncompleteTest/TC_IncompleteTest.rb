require 'RubyUnit/IncompleteTest'

module IncompleteTestTests
  #
  # Test Case for RubyUnit::IncompleteTest
  #
  class TC_IncompleteTest < RubyUnit::TestCase
    #
    # Validate that RubyUnit::IncompleteTest is an Exception
    #
    def isExceptionTest
      assertDescendent Exception, RubyUnit::IncompleteTest, 'IncompleteTest MUST be an Exception'
    end
  end
end
