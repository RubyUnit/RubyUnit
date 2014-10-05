# Test for RealNumber mixin
require_relative 'RealNumber'
require 'UnitTest'

class RealNumberTest < UnitTest::TestCase
  public
  def positiveData
    [
      [       Integer.new(1),],
      [    Integer.new(4242),],
      [       Float.new(0.1),],
      [       Float.new(1.0),],
      [     Float.new(42.42),],
      [   Rational.new(1,42),],
      [    Rational.new(1,1),],
      [Rational.new(4242,42),],
    ]
  end

  def zeroData
    [
      [   Integer.new(0)],
      [   Float.new(0.0)],
      [Rational.new(0,1)],
    ]
  end

  def negativeData
    [
      [       Integer.new(-1),],
      [    Integer.new(-4242),],
      [       Float.new(-0.1),],
      [       Float.new(-1.0),],
      [     Float.new(-42.42),],
      [   Rational.new(-1,42),],
      [    Rational.new(-1,1),],
      [Rational.new(-4242,42),],
    ]
  end
  
  def notPositive
    zeroData | negativeData
  end

  def notNegative
    zeroData | positiveData
  end

  def positiveTest value
    assert(value.positive?, "#{value.class}:(#{value}) should be positive!")
  end

  def notPositiveTest value
    assert(not value.positive?, "#{value.class}:(#{value}) should not be positive!")
  end

  def negativeTest value
    assert(value.negative?, "#{value.class}:(#{value}) should be negative!")
  end

  def notNegativeTest value
    assert(not value.negative?, "#{value.class}:(#{value}) should not be negative!")
  end
end
