require 'RubyUnit/AssertionFailure'

#
# Test Case for RubyUnit::AssertionFailure
#
class TEST_AssertionFailure < RubyUnit::TestCase
  def isExceptionTest
    assertDescendent Exception, RubyUnit::AssertionFailure, 'AssertionFailure MUST be an Exception!'
  end
end
