require 'RubyUnit/AssertionMessage'

# Data provider for RubyUnit::AssertionFailure tests
require_relative 'data/Constant'

module AssertionMessageTests
  ##
  # Test Case for RubyUnit::AssertionFailure
  #
  class TC_Constant < RubyUnit::TestCase
    include ConstantData

    ##
    # Assert all required constants are defined
    #
    def constantTest konstant
      assertConstDefined RubyUnit::AssertionFailure, konstant, 'Required constant is missing'
    end
  end
end
