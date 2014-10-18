require 'RubyUnit/AssertionFailure'

# Data provider for RubyUnit::AssertionFailure tests
require_relative 'data/AssertionFailure'

#
# Test Case for RubyUnit::AssertionFailure
#
class TEST_AssertionFailure < RubyUnit::TestCase
  include AssertionFailureData

  #
  # Validate that RubyUnit::AssertionFailure is an Exception
  #
  def isExceptionTest
    assertDescendent Exception, RubyUnit::AssertionFailure, 'AssertionFailure MUST be an Exception'
  end

  #
  # Assert all required constants are defined
  #
  def constantTest konstant
    assertConstDefined RubyUnit::AssertionFailure, konstant, 'Required constant is missing'
  end

  #
  # Test creation of default AssertionFailure
  #
  def createDefaultTest
    assertNothingRaised 'Should be able to create default AssertionFailure' do
      failure = RubyUnit::AssertionFailure.new
      hash = {}
      assertEqual hash, failure.data, 'Default data Hash should be empty'
    end
  end

  #
  # Test the data for the AssertionFailure
  #
  def dataTest data
    failure = RubyUnit::AssertionFailure.new(data)
    assertEqual data, failure.data, 'Assertion data Hash is incorrect'
  end

  #
  # Test the info string for the AssertionFailure
  #
  def infoTest data
    failure = RubyUnit::AssertionFailure.new(data)
    data.each do |index, value|
      assertMatch /#{index}/, failure.info, "Missing index for #{index}"
      assertMatch /#{value}/, failure.info, "Missing value for #{index}"
    end
  end
end
