#
# Data provider for RubyUnit::AssertionFailure class Test Case
#
module AssertionFailureData
  def constantData
    [
      ['FAILING'],
    ]
  end

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
