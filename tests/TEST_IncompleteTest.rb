require 'RubyUnit/IncompleteTest'

#
# Test Case for RubyUnit::IncompleteTest
#
class TEST_IncompleteTest < RubyUnit::TestCase
  #
  # Validate that RubyUnit::IncompleteTest is an Exception
  #
  def isExceptionTest
    assertDescendent Exception, RubyUnit::IncompleteTest, 'IncompleteTest MUST be an Exception'
  end
end
