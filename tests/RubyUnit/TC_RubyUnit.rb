require 'RubyUnit'

##
# Data provider for RubyUnit module
require_relative 'data/RubyUnit'

module RubyUnitTests
  ##
  # Test Case for the RubyUnit module
  #
  class TC_RubyUnit < RubyUnit::TestCase
    include RubyUnitTestsData

    ##
    # Verify that the VERSION constant is defined in the RubyUnit module
    #
    def constantTest konstant
      assertConstDefined RubyUnit, konstant, 'Expected constant missing'
    end

    ##
    # Test debug mode
    #
    def debugModeTest
      old_mode = RubyUnit.debug
      RubyUnit.debug = true
      assertEqual true, RubyUnit.debug, 'Debug mode should be true'
      RubyUnit.debug = false
      assertEqual false, RubyUnit.debug, 'Debug mode should be false'
      RubyUnit.debug = old_mode
    end

    ##
    # Test that debug mode doesn't accept non-Boolean
    #
    def invalidDebugModeTest mode
      old_mode = RubyUnit.debug
      assertRaiseExpected TypeError, RubyUnit::INVALID_DEBUG_MODE, RubyUnit::INVALID_DEBUG_MODE do
        RubyUnit.debug = mode
      end
      assertEqual old_mode, RubyUnit.debug, 'Invalid debug mode should not change debug mode'
    ensure
      RubyUnit.debug = old_mode
    end
  end
end
