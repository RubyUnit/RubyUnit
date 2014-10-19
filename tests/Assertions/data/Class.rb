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
      [
        
      ]
    end

    def assertKindOfWithMessageData
      add_parameter assertKindOfData
    end

    def assertKindOfWithMessageFailData
      add_parameter assertKindOfFailData
    end
  end
end
