require 'RubyUnit/TestCase'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/TestCase'

#
# Test Case for the RubyUnit::TestCase
#
class TEST_TestCase < RubyUnit::TestCase
  include TestCaseData

  def classMethodTest method
    assertRespondTo RubyUnit::TestCase, method, 'RubyUnit::TestCase missing class method'
  end

  def instanceMethodTests method
  end
end
