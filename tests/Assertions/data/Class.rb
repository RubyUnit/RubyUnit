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
  end
end
