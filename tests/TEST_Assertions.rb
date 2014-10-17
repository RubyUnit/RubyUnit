require 'RubyUnit/Assertions'

# Data provider for RubyUnit::TestCase tests
require_relative 'data/Assertions'

# Fixture for RubyUnit::TestCase tests
require_relative 'fixture/Assertions'

#
# Test Case for RubyUnit::Assertions module
#
class TEST_Assertions < RubyUnit::TestCase
  include AssertionsData

  #
  # Test that the correct instance methods are defined
  #
  def instanceMethodTest method
    asserts = AssertionsFixture.new
    assertRespondTo asserts, method, 'Assertions object missing instance method'
  end
end
