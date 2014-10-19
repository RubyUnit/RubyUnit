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
      [Numeric, Integer, Fixnum].each do |klass|
        data += add_parameter [[klass]], fixnumObjects
      end
      [Numeric, Integer, Bignum].each do |klass|
        data += add_parameter [[klass]], bignumObjects
      end
      [Numeric, Float].each do |klass|
        data += add_parameter [[klass]], floatObjects
      end
      [Numeric, Rational].each do |klass|
        data += add_parameter [[klass]], rationalObjects
      end
      [Numeric, Complex].each do |klass|
        data += add_parameter [[klass]], complexObjects
      end
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
