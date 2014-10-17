require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Assertions'

#
# Test Case for RubyUnit::Assertions module
#
class TEST_Assertions < RubyUnit::TestCase
  @assertions

  def setup
    @assertions = TestCase.assertions
  end

  def rescue_assertion &block
    
  end
end
