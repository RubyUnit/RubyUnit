require_relative 'ObjectTypes'

module AssertionsTests
  #
  # Data provider for RubyUnit::Assertions Comparisons assertions
  #
  module ComparisonsData
    include ObjectTypes

    def double data
      data.each do |params|
        params << params.first
      end
      data
    end

    def assertEqualData
      data = non_classes + classObjects
      double data
    end
    alias_method :assertNotEqualFailData, :assertEqualData

    def assertEqualFailData
      assertLessThanData + assertGreaterThanData
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

    def equalComparisonObjects
      data =
      fixnumObjects   +
      bignumObjects   +
      floatObjects    +
      rationalObjects +
      timeObjects

      double data
    end


    def assertGreaterThanData
      [
        
      ]
    end

    def assertGreaterThanFailData
      assertLessThanData + equalComparisonObjects
    end

    def assertGreaterThanWithMessageData
      add_parameter assertGreaterThanData
    end

    def assertGreaterThanWithMessageFailData
      add_parameter assertGreaterThanFailData
    end




    def assertGreaterThanOrEqualData
      assertGreaterThanData + equalComparisonObjects
    end

    def assertGreaterThanOrEqualFailData
      assertLessThanData
    end

    def assertGreaterThanOrEqualWithMessageData
      add_parameter assertGreaterThanOrEqualData
    end

    def assertGreaterThanOrEqualWithMessageFailData
      add_parameter assertGreaterThanOrEqualFailData
    end


    def assertLessThanData
      [
        
      ]
    end

    def assertLessThanFailData
      assertGreaterThanData + equalComparisonObjects
    end

    def assertLessThanWithMessageData
      add_parameter assertLessThanData
    end

    def assertLessThanWithMessageFailData
      add_parameter assertLessThanFailData
    end



    def assertLessThanOrEqualData
      assertLessThanData + equalComparisonObjects
    end

    def assertLessThanOrEqualFailData
      assertGreaterThanData
    end

    def assertLessThanOrEqualWithMessageData
      add_parameter assertLessThanOrEqualData
    end

    def assertLessThanOrEqualWithMessageFailData
      add_parameter assertLessThanOrEqualFailData
    end


    def assertMatchData
      [
        
      ]
    end

    def assertMatchFailData
      [
        
      ]
    end

    def assertMatchWithMessageData
      add_parameter assertMatchData
    end

    def assertMatchWithMessageFailData
      add_parameter assertMatchFailData
    end

    def assertNotMatchData
      [
        
      ]
    end

    def assertNotMatchFailData
      [
        
      ]
    end

    def assertNotMatchWithMessageData
      add_parameter assertNotMatchData
    end

    def assertNotMatchWithMessageFailData
      add_parameter assertNotMatchFailData
    end

    def assertSameData
      [
        
      ]
    end

    def assertSameFailData
      [
        
      ]
    end

    def assertSameWithMessageData
      add_parameter assertSameData
    end

    def assertSameWithMessageFailData
      add_parameter assertSameFailData
    end

    def assertNotSameData
      [
        
      ]
    end

    def assertNotSameFailData
      [
        
      ]
    end

    def assertNotSameWithMessageData
      add_parameter assertNotSameData
    end

    def assertNotSameWithMessageFailData
      add_parameter assertNotSameFailData
    end
  end
end
