require_relative 'ObjectTypes'

module AssertionsTests
  ##
  # Data provider for RubyUnit::Assertions Class assertions
  #
  module ClassData
    include ObjectTypes

    def assertKindOfData
      data  = add_parameter [[Class]], classObjects
      data += add_parameter [[NilClass]], nilObjects
      data += add_parameter [[TrueClass]], trueObjects
      data += add_parameter [[FalseClass]], falseObjects
      data += add_parameter [[Numeric], [Integer], [Fixnum]], fixnumObjects
      data += add_parameter [[Numeric], [Integer], [Bignum]], bignumObjects
      data += add_parameter [[Numeric], [Float]], floatObjects
      data += add_parameter [[Numeric], [Rational]], rationalObjects
      data += add_parameter [[Numeric], [Complex]], complexObjects
      data += add_parameter [[Time]], timeObjects
      data += add_parameter [[String]], stringObjects
      data += add_parameter [[Range]], rangeObjects
      data += add_parameter [[Regexp]], regexpObjects
      data += add_parameter [[Array]], arrayObjects
      data += add_parameter [[Hash]], hashObjects
    end

    def assertKindOfFailData
      data  = add_parameter classes_exclude([Class]), classObjects
      data += add_parameter classes_exclude([NilClass]), nilObjects
      data += add_parameter classes_exclude([TrueClass]), trueObjects
      data += add_parameter classes_exclude([FalseClass]), falseObjects
      data += add_parameter classes_exclude([Numeric, Integer, Fixnum]), fixnumObjects
      data += add_parameter classes_exclude([Numeric, Integer, Bignum]), bignumObjects
      data += add_parameter classes_exclude([Numeric, Float]), floatObjects
      data += add_parameter classes_exclude([Numeric, Rational]), rationalObjects
      data += add_parameter classes_exclude([Numeric, Complex]), complexObjects
      data += add_parameter classes_exclude([Time]), timeObjects
      data += add_parameter classes_exclude([String]), stringObjects
      data += add_parameter classes_exclude([Range]), rangeObjects
      data += add_parameter classes_exclude([Regexp]), regexpObjects
      data += add_parameter classes_exclude([Array]), arrayObjects
      data += add_parameter classes_exclude([Hash]), hashObjects
    end

    def assertKindOfInvalidData
      add_parameter non_classes, [[Object]]
    end

    def assertKindOfWithMessageData
      add_parameter assertKindOfData
    end

    def assertKindOfWithMessageFailData
      add_parameter assertKindOfFailData
    end

    def assertKindOfWithMessageInvalidData
      add_parameter assertKindOfInvalidData
    end

    def assertInstanceOfData
      data  = add_parameter [[Class]], classObjects
      data += add_parameter [[NilClass]], nilObjects
      data += add_parameter [[TrueClass]], trueObjects
      data += add_parameter [[FalseClass]], falseObjects
      data += add_parameter [[Fixnum]], fixnumObjects
      data += add_parameter [[Bignum]], bignumObjects
      data += add_parameter [[Float]], floatObjects
      data += add_parameter [[Rational]], rationalObjects
      data += add_parameter [[Complex]], complexObjects
      data += add_parameter [[Time]], timeObjects
      data += add_parameter [[String]], stringObjects
      data += add_parameter [[Range]], rangeObjects
      data += add_parameter [[Regexp]], regexpObjects
      data += add_parameter [[Array]], arrayObjects
      data += add_parameter [[Hash]], hashObjects
    end

    def assertInstanceOfFailData
      data  = add_parameter classes_exclude([Class]), classObjects
      data += add_parameter classes_exclude([NilClass]), nilObjects
      data += add_parameter classes_exclude([TrueClass]), trueObjects
      data += add_parameter classes_exclude([FalseClass]), falseObjects
      data += add_parameter classes_exclude([Fixnum]), fixnumObjects
      data += add_parameter classes_exclude([Bignum]), bignumObjects
      data += add_parameter classes_exclude([Float]), floatObjects
      data += add_parameter classes_exclude([Rational]), rationalObjects
      data += add_parameter classes_exclude([Complex]), complexObjects
      data += add_parameter classes_exclude([Time]), timeObjects
      data += add_parameter classes_exclude([String]), stringObjects
      data += add_parameter classes_exclude([Range]), rangeObjects
      data += add_parameter classes_exclude([Regexp]), regexpObjects
      data += add_parameter classes_exclude([Array]), arrayObjects
      data += add_parameter classes_exclude([Hash]), hashObjects
    end

    def assertInstanceOfInvalidData
      add_parameter non_classes, [[Object]]
    end

    def assertInstanceOfWithMessageData
      add_parameter assertInstanceOfData
    end

    def assertInstanceOfWithMessageFailData
      add_parameter assertInstanceOfFailData
    end

    def assertInstanceOfWithMessageInvalidData
      add_parameter assertInstanceOfInvalidData
    end

    def assertDescendentData
      data  = add_parameter [[BasicObject], [Object]], [[NilClass]]
      data += add_parameter [[BasicObject], [Object]], [[TrueClass]]
      data += add_parameter [[BasicObject], [Object]], [[FalseClass]]
      data += add_parameter [[BasicObject], [Object], [Numeric], [Integer]], [[Fixnum]]
      data += add_parameter [[BasicObject], [Object], [Numeric], [Integer]], [[Bignum]]
      data += add_parameter [[BasicObject], [Object], [Numeric]], [[Float]]
      data += add_parameter [[BasicObject], [Object], [Numeric]], [[Rational]]
      data += add_parameter [[BasicObject], [Object], [Numeric]], [[Complex]]
      data += add_parameter [[BasicObject], [Object]], [[Time]]
      data += add_parameter [[BasicObject], [Object]], [[String]]
      data += add_parameter [[BasicObject], [Object]], [[Range]]
      data += add_parameter [[BasicObject], [Object]], [[Regexp]]
      data += add_parameter [[BasicObject], [Object]], [[Array]]
      data += add_parameter [[BasicObject], [Object]], [[Hash]]
    end

    def assertDescendentFailData
      data  = add_parameter classes_exclude([BasicObject, Object]), [[NilClass]]
      data += add_parameter classes_exclude([BasicObject, Object]), [[TrueClass]]
      data += add_parameter classes_exclude([BasicObject, Object]), [[FalseClass]]
      data += add_parameter classes_exclude([BasicObject, Object, Numeric, Integer]), [[Fixnum]]
      data += add_parameter classes_exclude([BasicObject, Object, Numeric, Integer]), [[Bignum]]
      data += add_parameter classes_exclude([BasicObject, Object, Numeric]), [[Float]]
      data += add_parameter classes_exclude([BasicObject, Object, Numeric]), [[Rational]]
      data += add_parameter classes_exclude([BasicObject, Object, Numeric]), [[Complex]]
      data += add_parameter classes_exclude([BasicObject, Object]), [[Time]]
      data += add_parameter classes_exclude([BasicObject, Object]), [[String]]
      data += add_parameter classes_exclude([BasicObject, Object]), [[Range]]
      data += add_parameter classes_exclude([BasicObject, Object]), [[Regexp]]
      data += add_parameter classes_exclude([BasicObject, Object]), [[Array]]
      data += add_parameter classes_exclude([BasicObject, Object]), [[Hash]]
    end

    def assertDescendentInvalidData
      data  = add_parameter non_classes, [[Object]]
      data += add_parameter [[Object]], non_classes
      data += add_parameter non_classes, non_classes
    end

    def assertDescendentWithMessageData
      add_parameter assertDescendentData
    end

    def assertDescendentWithMessageFailData
      add_parameter assertDescendentFailData
    end

    def assertDescendentWithMessageInvalidData
      add_parameter assertDescendentInvalidData
    end
  end
end
