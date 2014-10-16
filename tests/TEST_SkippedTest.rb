require 'RubyUnit/SkippedTest'

#
# Test Case for RubyUnit::SkippedTest
#
class TEST_SkippedTest < RubyUnit::TestCase
  def isExceptionTest
    assertDescendent Exception, RubyUnit::SkippedTest, 'SkippedTest MUST be an Exception!'
  end
end
