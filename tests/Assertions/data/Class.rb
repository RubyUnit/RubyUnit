require_relative 'ObjectTypes'

module AssertionsTests
  ##
  # Data provider for RubyUnit::Assertions Class assertions
  #
  module ClassData
    include ObjectTypes

    def assertKindOfData
      data  = add_parameter [[Integer]], integerObjects
      data += add_parameter [[Bignum]], bigNumObjects
      data += add_parameter [[Float]], floatObjects
      data += add_parameter [[Class]], classObjects
      data += add_parameter [[String]], stringObjects
      data += add_parameter [[Regexp]], regexpObjects
      data += add_parameter [[Array]], arrayObjects
      data += add_parameter [[Hash]], hashObjects
    end

    def assertKindOfWithMessageData
      add_parameter assertKindOfData
    end
  end
end
