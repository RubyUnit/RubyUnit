require 'RubyUnit'

module RubyUnit
  #
  # Test for the RubyUnit module
  #
  class TEST_RubyUnit < TestCase
    #
    # Verify that the VERSION constant is defined in the RubyUnit module
    #
    def versionDefinedTest
      assertConstDefined RubyUnit, 'VERSION', 'Version must be defined in RubyUnit::VERSION!'
    end

    # TODO Add tests for at_exit
  end
end
