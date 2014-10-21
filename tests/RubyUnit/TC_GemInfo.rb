require 'RubyUnit'

##
# Data provider for RubyUnit::GemInfo tests
require_relative 'data/GemInfo'

module RubyUnitTests
  ##
  # Test Case for the RubyUnit::GemInfo module
  #
  class TC_GemInfo < RubyUnit::TestCase
    include GemInfoTestsData

    ##
    # Verify that the required constants are defined
    #
    def constantsDefinedTest konstant
      assertConstDefined RubyUnit::GemInfo, konstant, "missing constant in GemInfo: #{konstant}"
    end

    ##
    # Verify that the list of files contains the LICENSE file
    #
    def validateFilesIncludesLicenseTest
      assertInclude RubyUnit::GemInfo::FILES, 'LICENSE.md', 'Gem MUST be distributed with the license'
    end
  end
end
