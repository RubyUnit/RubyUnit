# Real Numbers (not complex)
module RealNumber
  # determines if a number is greater than zero
  def positive?
    self > 0
  end

  # determines if a number is less than zero
  def negative?
    self < 0
  end
end

class Integer
  # mixin RealNumber into Integer
  include RealNumber
end

class Float
  # mixin RealNumber into Float
  include RealNumber
end

class Rational
  # mixin RealNumber into Rational
  include RealNumber
end
