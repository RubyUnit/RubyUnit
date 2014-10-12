# Extend the class to add data providing functions
module RealNumberData
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
    zeroData + negativeData
  end

  def notNegativeData
    zeroData + positiveData
  end
end
