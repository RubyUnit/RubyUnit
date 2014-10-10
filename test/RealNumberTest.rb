# Test for RealNumber mixin
require_relative 'RealNumber'
require 'RubyUnit'

class RealNumberTest < RubyUnit::TestCase
  public
  def positiveData
    [
      [           Integer(1),],
      [        Integer(4242),],
      [Integer(100000000000),],
      [Integer(424200000000),],
      [           Float(0.1),],
      [           Float(1.0),],
      [         Float(42.42),],
      [       Rational(1,42),],
      [        Rational(1,1),],
      [    Rational(4242,42),],
    ]
  end

  def zeroData
    [
      [   Integer(0)],
      [   Float(0.0)],
      [Rational(0,1)],
    ]
  end

  def negativeData
    [
      [           Integer(-1),],
      [        Integer(-4242),],
      [Integer(-100000000000),],
      [Integer(-424200000000),],
      [           Float(-0.1),],
      [           Float(-1.0),],
      [         Float(-42.42),],
      [       Rational(-1,42),],
      [        Rational(-1,1),],
      [    Rational(-4242,42),],
    ]
  end

  def notPositiveData
    zeroData | negativeData
  end

  def notNegativeData
    zeroData | positiveData
  end

  def positiveTest value
    assert value.positive?, "#{value.class}:(#{value}) should be positive!"
  end

  def notPositiveTest value
    assertNot value.positive?, "#{value.class}:(#{value}) should not be positive!"
  end

  def negativeTest value
    assert value.negative?, "#{value.class}:(#{value}) should be negative!"
  end

  def notNegativeTest value
    assertNot value.negative?, "#{value.class}:(#{value}) should not be negative!"
  end
end
