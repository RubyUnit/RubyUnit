require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Basic'

module AssertionsTests
  #
  # Test Case for RubyUnit::Assertions module
  #
  class TC_Basic < AssertionsTestCase
    include BasicTestsData
    @assertions

    #
    # Setup tests
    #
    def setup
      @assertions = RubyUnit::TestCase.assertions
    end

    #
    # Teardown tests
    #
    def teardown
      assertGreaterThan @@assertions, @assertions, 'Test should make assertions'
    end

    #
    # Test for default fail
    #
    def failDefaultTest
      rescue_assertion /#{RubyUnit::AssertionFailure::FAILING}/ do
        fail
      end
    end

    #
    # Test fail
    #
    def failTest data = {}
      rescue_assertion /#{RubyUnit::AssertionFailure::FAILING}/, @@message, data do
        fail @@message, data
      end
    end

    #
    # Test assert
    #
    def assertTest value
      assert value
    end

    #
    # Test assert with message
    #
    def assertMessageTest value
      assert value, @@message
    end

    #
    # Test assert failure
    #
    def assertFailTest value
      rescue_assertion /#{RubyUnit::AssertionFailure::ASSERT_ERROR}/ do
        assert value
      end
    end

    #
    # Test assert failure with message
    #
    def assertFailTest value
      rescue_assertion /#{RubyUnit::AssertionFailure::ASSERT_ERROR}/, @@message do
        assert value, @@message
      end
    end
  end
end
