require_relative 'ObjectTypes'

module AssertionsTests
  ##
  # Data provider for RubyUnit::Assertions Exceptions assertions
  #
  module ExceptionsData
    include ObjectTypes

    def assertNothingRaisedData
      non_classes + classObjects
    end

    def assertNothingRaisedWithMessageData
      add_parameter assertNothingRaisedData
    end

    def assertNothingRaisedWithMessageFailData
      MESSAGE
    end

    def assertRaiseMessageData
      [
        [      /^Message/,     Exception, 'Message raised'],
        [      / raised$/, StandardError, 'Message raised'],
        ['Message raised', ArgumentError, 'Message raised'],
      ]
    end
    alias_method :assertRaiseExpectedData, :assertRaiseMessageData

    def assertRaiseMessageInvalidData
      exceptionObjects +
      nilObjects       +
      trueObjects      +
      falseObjects     +
      fixnumObjects    +
      bignumObjects    +
      floatObjects     +
      rationalObjects  +
      complexObjects   +
      timeObjects      +
      rangeObjects     +
      arrayObjects     +
      hashObjects
    end

    def assertRaiseMessageFailData
      [
        [      /Message$/,     Exception],
        [      /No Match/, StandardError],
        [       'Message', ArgumentError],
        [      'No Match',     TypeError],
      ]
    end

    def assertRaiseMessageWithMessageData
      add_parameter assertRaiseMessageData
    end
    alias_method :assertRaiseExpectedWithMessageData, :assertRaiseMessageWithMessageData

    def assertRaiseMessageWithMessageFailData
      add_parameter assertRaiseMessageFailData
    end

    def assertRaiseMessageWithMessageInvalidData
      add_parameter assertRaiseMessageInvalidData
    end

    def assertRaiseKindOfData
      exceptionObjects
    end
    alias_method :assertRaiseKindOfFailData, :assertRaiseKindOfData

    def assertRaiseKindOfInvalidData
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

    def assertRaiseKindOfWithMessageData
      add_parameter assertRaiseKindOfData
    end

    def assertRaiseKindOfWithMessageFailData
      add_parameter assertRaiseKindOfFailData
    end

    def assertRaiseKindOfWithMessageInvalidData
      add_parameter assertRaiseKindOfInvalidData
    end
  end
end
