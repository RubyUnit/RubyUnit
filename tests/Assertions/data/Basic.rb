module AssertionsTests
  #
  # Data provider for RubyUnit::TestCase class Test Case
  #
  module BasicTestsData
    def failData
      [
        ['message'                            ],
        ['message', {:string=>'test',:int=>10}],
      ]
    end
  end
end
