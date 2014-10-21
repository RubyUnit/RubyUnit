require 'RubyUnit/AssertionFailure'

##
# Data provider for RubyUnit::AssertionFailure tests
require_relative 'data/Instance'

module AssertionFailureTests
  ##
  # Test Case for RubyUnit::AssertionFailure
  #
  class TC_Instance < RubyUnit::TestCase
    include InstanceData

    ##
    # Test the info string for the AssertionFailure
    #
    def assertionFailureTest data, message
      begin
        raise RubyUnit::AssertionFailure.new(data), message
      rescue RubyUnit::AssertionFailure => failure
        assertEqual data, failure.data, 'Assertion data Hash is incorrect'
        assertEqual message, failure.message, 'Excpected message mismatch'
        data.each do |index, value|
          assertMatch /#{index}/, failure.info, "Missing index for #{index}"
          assertMatch /#{value}/, failure.info, "Missing value for #{index}"
        end
      end
    end
  end
end
