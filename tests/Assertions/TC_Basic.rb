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
    def failTest message = nil, data = {}
      rescue_assertion /#{RubyUnit::AssertionFailure::FAILING}/, message, data do
        fail message, data
      end
    end

    #
    # Test fail with message
    #
    def failWithMessageTest data = {}
      failTest @@message, data
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
    def assertFailTest value, message = nil
      rescue_assertion /#{RubyUnit::AssertionFailure::ASSERT_ERROR}/, message do
        assert value, message
      end
    end

    #
    # Test assert failure with message
    #
    def assertFailWithMessageTest value
      assertFailTest value, @@message
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
    def assertNotWithMessageTest value
      assertNot value, @@message
    end

    #
    # Test assertNot failure
    #
    def assertNotFailTest value, message = nil
      rescue_assertion /#{RubyUnit::AssertionFailure::ASSERT_NOT_ERROR}/ do
        assertNot value, message
      end
    end

    #
    # Test assertNot failure with message
    #
    def assertNotFailWithMessageTest value
      assertNotFailTest value, @@message
    end
  end
end
