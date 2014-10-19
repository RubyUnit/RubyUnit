module AssertionsTests
  module ObjectTypes
    def basicObjects
      integerObjects +
      bigNumObjects  +
      floatObjects   +
      classObjects   +
      stringObjects  +
      regexpObjects  +
      arrayObjects   +
      hashObjects
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

    def integerObjects
      [
        [-42],
        [ -1],
        [  0],
        [  1],
        [ 42],
      ]
    end

    def bigNumObjects
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

    def classObjects
      [
        [  Module],
        [   Class],
        [ Integer],
        [  Bignum],
        [Rational],
        [  Regexp],
        [    Hash],
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
        [integerObjects.flatten],
        [ bigNumObjects.flatten],
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