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

    def assertNothingRaisedFailData
      stringObjects
    end

    def assertNothingRaisedWithMessageData
      add_parameter assertNothingRaisedData
    end

    def assertNothingRaisedWithMessageFailData
      add_parameter stringObjects
    end

    def assertRaiseMessageData
      [
        [      /^Message/,     Exception, 'Message thrown'],
        [      / thrown$/, StandardError, 'Message thrown'],
        ['Message thrown', ArgumentError, 'Message thrown'],
      ]
    end

    def assertRaiseMessageWithMessageData
      add_parameter assertRaiseMessageData
    end
  end
end
