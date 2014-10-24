require_relative 'ObjectTypes'

module AssertionsTests
  #
  # Data provider for RubyUnit::Assertions Comparisons assertions
  #
  module ComparisonsData
    include ObjectTypes

    def assertEqualData
      data = non_classes + classObjects
      # TODO: check this
      data.each do |params|
        params << params.first
      end
      data
    end
    alias_method :assertNotEqualFailData, :assertEqualData

    def assertEqualFailData
      [
        
      ]
    end
    alias_method :assertNotEqualData, :assertEqualFailData
    
    def assertEqualWithMessageData
      add_parameter assertEqualData
    end
    alias_method :assertNotEqualWithMessageFailData, :assertEqualWithMessageData

    def assertEqualWithMessageFailData
      add_parameter assertEqualFailData
    end
    alias_method :assertNotEqualWithMessageData, :assertEqualWithMessageFailData

    def assertGreaterThanData
      [
        
      ]
    end

    def assertGreaterThanFailData
      [
        
      ]
    end

    def assertGreaterThanWithMessageData
      add_parameter assertGreaterThanData
    end

    def assertGreaterThanWithMessageFailData
      add_parameter assertGreaterThanFailData
    end
  end
end
