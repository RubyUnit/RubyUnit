module AssertionsTests
  #
  # Data provider for RubyUnit::TestCase class Test Case
  #
  module BasicTestsData
    def failWithMessageData
      [
        [{:string=>'string',:int=>42}],
        [                            ],
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
    [:assertMessageData, :assertNotFailData, :assertNotFailWithMessageData].each do |method|
      alias_method method, :assertData
    end

    def assertFailData
      assertFalseData + assertNilData
    end
    [:assertFailWithMessageData, :assertNotData, :assertNotWithMessageData].each do |method|
      alias_method method, :assertFailData
    end

    def assertTrueData
      [
        [true],
      ]
    end
    alias_method :assertTrueWithMessageData, :assertTrueData

    def assertTrueFailData
      trueObjects + assertFailData
    end
    alias_method :assertTrueFailWithMessageData, :assertTrueFailData

    def assertFalseData
      [
        [false],
      ]
    end
    alias_method :assertFalseWithMessageData, :assertFalseData

    def assertFalseFailData
      assertData + assertNilData
    end
    alias_method :assertFalseFailWithMessageData, :assertFalseFailData
 
    def assertNilData
      [
        [nil],
      ]
    end
  end
end
