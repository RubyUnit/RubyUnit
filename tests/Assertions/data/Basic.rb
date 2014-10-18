module AssertionsTests
  #
  # Data provider for RubyUnit::TestCase class Test Case
  #
  module BasicTestsData
    def failData
      [
        ['Assertion Message', {:string=>'test',:int=>10}],
        ['Assertion Message'                            ],
      ]
    end

    def trueObject
      [
        [        0],
        [        1],
        [       -1],
        [       42],
        [    Class],
        [ 'String'],
        [ /Regexp/],
        [[1,2,3,4]],
      ]
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
