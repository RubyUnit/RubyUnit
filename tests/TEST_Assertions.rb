require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Assertions'

#
# Test Case for RubyUnit::Assertions module
#
class TEST_Assertions < RubyUnit::TestCase
  include AssertionsData
  @assertions

  #
  # Setup tests
  #
  def setup
    @assertions = RubyUnit::TestCase.assertions
  end

  #
  # Wrapper to rescue assertions
  #
  def rescue_assertion pattern = '', message = nil, data = {}, &block
    e = assertRaiseExpected RubyUnit::AssertionFailure, pattern, message do
      yield
    end
    assertMatch /#{message}/, e.message
  end

  #
  # Test for default failure
  #
  def faiDefaultTest
    rescue_assertion /#{RubyUnit::AssertionFailure::FAILING}/ do
      fail
    end
  end
end
