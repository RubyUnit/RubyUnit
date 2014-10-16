require 'RubyUnit/TestCase'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/TestCase'

# Fixture for RubyUnit::TestCase tests
require_relative 'fixture/TestCase'

#
# Test Case for the RubyUnit::TestCase
#
class TEST_TestCase < RubyUnit::TestCase
  include TestCaseData
  @setup
  @teardown

  #
  # Initialize setup and teardown before each test
  #
  def initialize
    super
    @setup    = false
    @teardown = false
  end

  class << self
    # Track whether class setup has been run
    @@setup    = false
    # Track whether class teardown has been run
    @@teardown = false

    #
    # Setup before class
    #
    def setup
      @@setup = true
    end

    #
    # Teardown after class
    #
    def teardown
      @@teardown = true
    end
  end

  #
  # Setup before test
  # * self.setup has been run before test begins
  # * self.teardown has not been run before test begins
  # * setup is only run once
  #
  def setup
    assert @@setup, 'setup class method MUST be run before tests begin.'
    assertNot @@teardown, 'teardown class should NOT be run before testing'
    assertNot @setup, 'setup instance method should only be run once'
    @setup = true
  end

  #
  # Teardown after test
  #
  def teardown
    @teardown = true
  end

  #
  # Test that the correct class methods are defined
  #
  def classMethodTest method
    assertRespondTo RubyUnit::TestCase, method, 'RubyUnit::TestCase missing class method'
  end

  #
  # Test that the correct instance methods are defined
  #
  def instanceMethodTest method
    test_case = TestCaseFixture.new
    assertRespondTo test_case, method, 'Test Case object missing instance method'
  end

  #
  # Test that setup is run before test
  #
  def setupBeforeTestTest
    assert @setup, 'setup instance method MUST be run before test'
  end

  #
  # Test that teardown is not run before test
  #
  def noTeardownBeforeTestTest
    assertNot @teardown, 'teardown instance method should NOT be run before test'
  end

  #
  # Test that markSkipped raises proper exception
  #
  def markSkippedTest
    message = 'markSkipped should raise RubyUnit::SkippedTest'
    assertRaiseExpected RubyUnit::SkippedTest, message, message do
      markSkipped message
    end
  end

  #
  # Test that markIncomplete raises proper exception
  #
  def markIncompleteTest
    message = 'markIncomplete should raise RubyUnit::IncompleteTest'
    assertRaiseExpected RubyUnit::IncompleteTest, message, message do
      markIncomplete message
    end
  end
end
