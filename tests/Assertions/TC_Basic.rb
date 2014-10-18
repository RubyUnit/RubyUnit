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
      failTest
    end

    #
    # Test fail
    #
    def failTest data = {}, message = @@message
      rescue_assertion /#{RubyUnit::AssertionFailure::FAILING}/, message, data do
        fail message, data
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

    #
    # Test assertNot
    #
    def assertNotTest value
      assertNot value
    end

    #
    # Test assertNot with message
    #
    def assertNotTest value
      assertNot value, @@message
    end

    #
    # Test assertNot failure
    #
    def assertNotFailTest value
      rescue_assertion /#{RubyUnit::AssertionFailure::ASSERT_NOT_ERROR}/ do
        assertNot value
      end
    end

    #
    # Test assertNot failure with message
    #
    def assertNotFailTest value
      rescue_assertion /#{RubyUnit::AssertionFailure::ASSERT_NOT_ERROR}/, @@message do
        assertNot value, @@message
      end
    end
  end
end
