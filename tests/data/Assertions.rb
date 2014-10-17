#
# Data provider for RubyUnit::TestCase class Test Case
#
module AssertionsData
  def instanceMethodData
    [
      # assertions
      [:assertNot],
      [:assert],
      [:assertNot],
      [:assertEqual],
      [:assertNotEqual],
      [:assertMatch],
      [:assertNotMatch],
      [:assertSame],
      [:assertNotSame],
      [:assertKindOf],
      [:assertNotKindOf],
      [:assertInstanceOf],
      [:assertNotInstanceOf],
      [:assertRespondTo],
      [:assertNotRespondTo],
      [:assertInclude],
      [:assertNotInclude],
      [:assertDescendent],
      [:assertNotDescendent],
      [:assertConst],
      [:assertConstDefined],
      [:assertConstNotDefined],
      [:assertNothingRaised],
      [:assertRaiseMessage],
      [:assertRaiseKindOf],
      [:assertRaiseExpected],
      # alias methods
      # [],
    ]
  end

  def privateInstanceMethodData
    [
      [:build_message],
      [:__wrap_assertion],
      [:__assert],
      [:__reject],
      [:__validate_exception],
    ]
  end
end
