require 'RubyUnit'
require_relative 'data/GemInfo'

module RubyUnit
  #
  # Test for the GemInfo module
  #
  module GemInfo
    class TEST_GemInfo < TestCase
      include GemInfoData
      
      #
      # Verify that the required constants are defined
      #
      def constantsDefinedTest konstant
        assertConstDefined RubyUnit::GemInfo, konstant, "missing constant in GemInfo: #{konstant}!"
      end
      
      #
      # Verify that the list of files contains the LICENSE file
      #
      def validateFilesIncludesLicenseTest
        assertInclude RubyUnit::GemInfo::Files, 'LICENSE.md', 'Gem MUST be distributed with the license!'
      end
    end
  end
end
