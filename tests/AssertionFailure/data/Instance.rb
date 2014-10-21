module AssertionFailureTests
  #
  # Data provider for RubyUnit::AssertionFailure class Test Case
  #
  module InstanceData
    def assertionFailureData
      [
                                                {},
                                {:regex=>/Regexp/},
                      {:string=>'string',:int=>42},
        {:class=>Class,:int=>42,:string=>'string'},
      ].product [
                                          '',
         'AssertionsTests Assertion Message',
        "#{'iterpolated'} Assertion Message",
      ]
    end
  end
end
