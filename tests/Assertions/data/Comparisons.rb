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
        # Fixnum
        [-42, -420],
        [ 42,  -42],
        [ 42,    0],
        # Bignum
        [-42000000000000000, -420000000000000000],
        [ 42000000000000000,  -42000000000000000],
        [ 42000000000000000,                   0],
        # Float
        [-4.2, -42.0],
        [ 4.2,  -4.2],
        [ 4.2,   0.0],
        # Rational
        [Rational(-4,2), Rational(-42,4)],
        [ Rational(4,2),  Rational(-4,2)],
        [ Rational(4,2),   Rational(0,1)],
        # Time
        [        Time.new(2002), Time.new(2001, 12, 31)],
        [    Time.new(2002, 10),      Time.new(2002, 9)],
        [Time.new(2002, 10, 31),         Time.new(2001)],
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
        # Fixnum
        [-420, -42],
        [ -42,  42],
        [   0,  42],
        # Bignum
        [-420000000000000000, -42000000000000000],
        [ -42000000000000000,  42000000000000000],
        [                  0,  42000000000000000],
        # Float
        [-42.0, -4.2],
        [ -4.2,  4.2],
        [  0.0,  4.2],
        # Rational
        [Rational(-42,4), Rational(-4,2)],
        [ Rational(-4,2),  Rational(4,2)],
        [  Rational(0,1),  Rational(4,2)],
        # Time
        [Time.new(2001, 12, 31),         Time.new(2002)],
        [     Time.new(2002, 9),     Time.new(2002, 10)],
        [        Time.new(2001), Time.new(2002, 10, 31)],
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
