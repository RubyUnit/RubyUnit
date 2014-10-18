module AssertionsTests
  #
  # Data provider for RubyUnit::TestCase class Test Case
  #
  module BasicTestsData
    def failData
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
      trueData + trueObjects
    end

    def assertMessageData
      assertData
    end

    def assertFailData
      falseData + nilData
    end

    def assertNotData
      assertFailData
    end

    def assertNotWithMessageData
      assertNotData
    end

    def assertNotFailData
      assertData
    end

    def assertNotFailWithMessageData
      assertNotFailData
    end

    def trueData
      [
        [true],
      ]
    end

    def falseData
      [
        [false],
      ]
    end

    def nilData
      [
        [nil],
      ]
    end
  end
end
