require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Assertions'

#
# Test Case for RubyUnit::Assertions module
#
class TEST_Assertions < RubyUnit::TestCase
  @assertions

  #
  # Setup tests
  #
  def setup
    @assertions = TestCase.assertions
  end

  #
  # Wrapper to rescue assertions
  #
  def rescue_assertion pattern = '', &block
    assertRaiseExpected RubyUnit::AssertionFailure, pattern do
      yield
    end
  end

  
end
