#
# Data provider for RubyUnit::TestCase class Test Case
#
module TestCaseData
  def classMethodData
    [
      [      :setup],
      [   :teardown],
      [:descendents],
      [ :assertions],
    ]
  end
end
