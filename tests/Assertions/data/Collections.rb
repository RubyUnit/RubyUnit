require_relative 'ObjectTypes'

module AssertionsTests
  #
  # Data provider for RubyUnit::Assertions Collections assertions
  #
  module CollectionsData
    include ObjectTypes

    def assertEmptyData
      [
        [''],
        [[]],
        [{}],
      ]
    end
    alias_method :assertNotEmptyFailData, :assertEmptyData

    def assertEmptyFailData
      stringObjects - [[""]] +
      arrayObjects  - [[[]]] +
      hashObjects   - [[{}]]
    end
    alias_method :assertNotEmptyData, :assertEmptyFailData

    def assertEmptyInvalidData
      fixnumObjects   +
      bignumObjects   +
      floatObjects    +
      rationalObjects +
      complexObjects  +
      timeObjects     +
      rangeObjects    +
      regexpObjects
    end
    alias_method :assertNotEmptyInvalidData, :assertEmptyInvalidData

    def assertEmptyWithMessageInvalidData
      add_parameter assertEmptyInvalidData
    end
    alias_method :assertNotEmptyWithMessageInvalidData, :assertEmptyWithMessageInvalidData

    def assertEmptyWithMessageData
      add_parameter assertEmptyData
    end
    alias_method :assertNotEmptyWithMessageFailData, :assertEmptyWithMessageData

    def assertEmptyWithMessageFailData
      add_parameter assertEmptyFailData
    end
    alias_method :assertNotEmptyWithMessageData, :assertEmptyWithMessageFailData
  end
end
