module AssertionsTests
  module ObjectTypes
    def basicObjects
      fixnumObjects   +
      bignumObjects   +
      floatObjects    +
      rationalObjects +
      complexObjects  +
      timeObjects     +
      stringObjects   +
      rangeObjects    +
      regexpObjects   +
      arrayObjects    +
      hashObjects
    end

    def classes_exclude klasses
      classes = classObjects
      klasses.each do |klass|
        classes -= [[klass]]
      end
      classes
    end

    def non_classes
      nilObjects      +
      trueObjects     +
      falseObjects    +
      fixnumObjects   +
      bignumObjects   +
      floatObjects    +
      rationalObjects +
      complexObjects  +
      timeObjects     +
      stringObjects   +
      rangeObjects    +
      regexpObjects   +
      arrayObjects    +
      hashObjects
    end

    def classObjects
      [
        [  NilClass],
        [ TrueClass],
        [FalseClass],
        [   Numeric],
        [   Integer],
        [    Fixnum],
        [    Bignum],
        [     Float],
        [  Rational],
        [   Complex],
        [      Time],
        [    String],
        [     Range],
        [     Array],
        [      Hash],
      ]
    end

    def nilObjects
      [
        [nil]
      ]
    end

    def trueObjects
      [
        [true]
      ]
    end

    def falseObjects
      [
        [false]
      ]
    end

    def fixnumObjects
      [
        [-42],
        [ -1],
        [  0],
        [  1],
        [ 42],
      ]
    end

    def bignumObjects
      [
        [-42000000000000000000],
        [ 42000000000000000000],
      ]
    end

    def floatObjects
      [
        [  -4.2],
        [-0.042],
        [   0.0],
        [ 0.042],
        [   4.2],
      ]
    end

    def rationalObjects
      [
        [    Rational(1)],
        [ Rational(2, 3)],
        [Rational(4, -6)],
        [  Rational(0.3)],
        [Rational('0.3')],
        [Rational('2/3')],
      ]
    end

    def complexObjects
      [
        [         Complex(1)],
        [      Complex(2, 3)],
        [Complex.polar(2, 3)],
        [       Complex(0.3)],
        [Complex('0.3-0.5i')],
        [Complex('2/3+3/4i')],
        [     Complex('1@2')],
      ]
    end

    def timeObjects
      [
        [                           Time.new(2002)],
        [                       Time.new(2002, 10)],
        [                   Time.new(2002, 10, 31)],
        [Time.new(2002, 10, 31, 2, 2, 2, "+02:00")],
        [                       Time.at(628232400)],
      ]
    end

    def stringObjects
      [
        [                   ''],
        [         'string one'],
        [           "STRING 2"],
        [       "String #{42}"],
        [    'Two Word string'],
        ["Three\nLINE\nString"],
      ]
    end

    def rangeObjects
      [
        [   (-1..-5)],
        [   (-5..-1)],
        [ ('a'..'e')],
        [('a'...'e')],
      ]
    end

    def regexpObjects
      [
        [                          //],
        [                  /Regexp 1/],
        [            /\AStart Regexp/],
        [               /END regexp$/],
        [/^#{'interpolated'} REGEXP$/],
      ]
    end

    def arrayObjects
      [
        [                    []],
        [fixnumObjects.flatten],
        [ bignumObjects.flatten],
        [  floatObjects.flatten],
        [  classObjects.flatten],
        [ stringObjects.flatten],
        [ regexpObjects.flatten],
      ]
    end

    def hashObjects
      [
        [                                        {}],
        [                        {:regex=>/Regexp/}],
        [              {:string=>'string',:int=>42}],
        [{:class=>Class,:int=>42,:string=>'string'}],
      ]
    end
  end
end