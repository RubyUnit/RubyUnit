module AssertionFailureTests
  #
  # Data provider for RubyUnit::AssertionFailure class Test Case
  #
  module InstanceTestsData
    def dataData
      [
        [{}],
      ] +
      infoData
    end

    def infoData
      [
        [{       :integer=>42, :string=>'string'}],
        [{'String Index'=>nil, :string=>'string'}],
      ]
    end
  end
end
