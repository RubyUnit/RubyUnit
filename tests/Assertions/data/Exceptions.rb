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

    def assertRaiseMessageFailData
      [
        [/Message$/,     Exception, 'Message raised'],
        [/No Match/, StandardError, 'Message raised'],
        [ 'Message', ArgumentError, 'Message raised'],
        ['No Match',     TypeError, 'Message raised'],
      ]
    end

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

    def assertRaiseExpectedFailData
      [
        [      /Message$/,     Exception,     Exception, 'Message raised'],
        [      /No Match/, StandardError, StandardError, 'Message raised'],
        [       'Message', ArgumentError, ArgumentError, 'Message raised'],
        [      'No Match',     TypeError,     TypeError, 'Message raised'],
        ['Message raised', StandardError,     Exception, 'Message raised'],
        ['Message raised', ArgumentError, StandardError, 'Message raised'],
        ['Message raised',     TypeError, ArgumentError, 'Message raised'],
        [      /Message$/, StandardError,     Exception, 'Message raised'],
        [      /No Match/, ArgumentError, StandardError, 'Message raised'],
        [       'Message',     TypeError, ArgumentError, 'Message raised'],
        [      'No Match',     Exception,     TypeError, 'Message raised'],
      ]
    end

    def assertRaiseExpectedInvalidExceptionData
      add_parameter MESSAGE, assertRaiseKindOfInvalidData
    end

    def assertRaiseExpectedInvalidErrorData
      add_parameter assertRaiseMessageInvalidData, [[StandardError]]
    end

    def assertRaiseExpectedInvalidBothData
      add_parameter assertRaiseMessageInvalidData, assertRaiseKindOfInvalidData
    end

    def assertRaiseExpectedWithMessageFailData
      add_parameter assertRaiseExpectedFailData
    end

    def assertRaiseExpectedInvalidExceptionWithMessageData
      add_parameter assertRaiseExpectedInvalidExceptionData
    end

    def assertRaiseExpectedInvalidErrorWithMessageData
      add_parameter assertRaiseExpectedInvalidErrorData
    end

    def assertRaiseExpectedInvalidBothWithMessageData
      add_parameter assertRaiseExpectedInvalidBothData
    end
  end
end
