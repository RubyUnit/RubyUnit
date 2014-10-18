module AssertionsTests
  #
  # Data provider for RubyUnit::TestCase class Test Case
  #
  module BasicTestsData

    def failWithMessageData
      AssertionsTests::MESSAGES.collect {|message| [message]}
    end

    def failWithDataData
      AssertionsTests::MESSAGES.product [
        {:string=>'string',:int=>42},
                                  {}, # Empty
      ]
    end

    def trueObjects
      [
        [                            0],
        [                            1],
        [                           -1],
        [                           42],
        [                        Class],
        [                     'String'],
        [                     /Regexp/],
        [                    [1,2,3,4]],
        [{:int=>42, :string=>'string'}],
      ]
    end

    def assertData
      assertTrueData + trueObjects
    end
    alias_method :assertNotFailData, :assertData

    def assertFailData
      assertFalseData + assertNilData
    end
    alias_method :assertNotData, :assertFailData

    def assertWithMessageData
      assertData.flatten.product AssertionsTests::MESSAGES
    end
    alias_method :assertNotFailWithMessageData, :assertWithMessageData

    def assertFailWithMessageData
      assertFailData.flatten.product AssertionsTests::MESSAGES
    end
    alias_method :assertNotWithMessageData, :assertFailWithMessageData

    def assertTrueData
      [
        [true],
      ]
    end

    def assertTrueFailData
      assertFalseData + assertNilData + trueObjects
    end

    def assertTrueWithMessageData
      assertTrueData.flatten.product AssertionsTests::MESSAGES
    end

    def assertTrueFailWithMessageData
      assertTrueFailData.flatten.product AssertionsTests::MESSAGES
    end

    def assertFalseData
      [
        [false],
      ]
    end
 
    def assertFalseFailData
      assertTrueData + trueObjects + assertNilData
    end

    def assertFalseWithMessageData
      assertFalseData.flatten.product AssertionsTests::MESSAGES
    end

    def assertFalseFailWithMessageData
      assertFalseFailData.flatten.product AssertionsTests::MESSAGES
    end

    def assertNilData
      [
        [nil],
      ]
    end

    def assertNilFailData
      assertData + assertFalseData
    end

    def assertNilWithMessageData
      assertNilData.flatten.product AssertionsTests::MESSAGES
    end

    def assertNilFailWithMessageData
      assertNilFailData.flatten.product AssertionsTests::MESSAGES
    end

    def assertNotNilData
      assertTrueData + assertFalseData + trueObjects
    end

    def assertNotNilFailData
      assertNilData
    end

    def assertNotNilWithMessageData
      assertNotNilData.flatten.product AssertionsTests::MESSAGES
    end

    def assertNotNilFailWithMessageData
      assertNotNilFailData.flatten.product AssertionsTests::MESSAGES
    end
  end
end
