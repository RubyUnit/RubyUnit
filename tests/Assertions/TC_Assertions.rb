require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Assertions'

module AssertionsTests
  #
  # Test Case for RubyUnit::Assertions module
  #
  class TC_Assertions < RubyUnit::TestCase
    include AssertionsTestsData
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
      assertRaiseExpected RubyUnit::AssertionFailure, pattern, message do
        yield
      end
    end

    #
    # Test for default failure
    #
    def failDefaultTest
      rescue_assertion /#{RubyUnit::AssertionFailure::FAILING}/ do
        fail
      end
    end
  end
end
