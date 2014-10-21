require_relative 'ObjectTypes'

module AssertionsTests
  #
  # Data provider for RubyUnit::Assertions Basic assertions
  #
  module BasicData
    include ObjectTypes

    def failWithMessageData
      AssertionsTests::MESSAGE
    end

    def failWithDataData
      add_parameter AssertionsTests::MESSAGE, hashObjects
    end

    def assertData
      trueObjects + basicObjects
    end
    alias_method :assertNotFailData, :assertData

    def assertWithMessageData
      add_parameter assertData
    end
    alias_method :assertNotFailWithMessageData, :assertWithMessageData

    def assertFailData
      falseObjects + nilObjects
    end
    alias_method :assertNotData, :assertFailData

    def assertFailWithMessageData
      add_parameter assertFailData
    end
    alias_method :assertNotWithMessageData, :assertFailWithMessageData

    def assertTrueData
      trueObjects
    end

    def assertTrueWithMessageData
      add_parameter assertTrueData
    end

    def assertTrueFailData
      falseObjects + nilObjects + basicObjects
    end

    def assertTrueFailWithMessageData
      add_parameter assertTrueFailData
    end

    def assertFalseData
      falseObjects
    end
 
    def assertFalseWithMessageData
      add_parameter assertFalseData
    end

    def assertFalseFailData
      trueObjects + basicObjects + nilObjects
    end

    def assertFalseFailWithMessageData
      add_parameter assertFalseFailData
    end

    def assertNilData
      nilObjects
    end
    alias_method :assertNotNilFailData, :assertNilData

    def assertNilWithMessageData
      add_parameter assertNilData
    end
    alias_method :assertNotNilFailWithMessageData, :assertNilWithMessageData

    def assertNilFailData
      trueObjects + basicObjects + falseObjects
    end
    alias_method :assertNotNilData, :assertNilFailData

    def assertNilFailWithMessageData
      add_parameter assertNilFailData
    end
    alias_method :assertNotNilWithMessageData, :assertNilFailWithMessageData
  end
end
