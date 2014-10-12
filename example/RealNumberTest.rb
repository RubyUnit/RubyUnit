require_relative 'RealNumber'
require_relative 'RealNumberData'

# Test for RealNumber mixin
class RealNumberTest < RubyUnit::TestCase
  include RealNumberData

  def positiveTest value
    assert value.positive?, "#{value.class}:(#{value}) should be positive!"
  end

  def notPositiveTest value
    assertNot value.positive?, "#{value.class}:(#{value}) should not be positive!"
  end

  def negativeTest value
    assert value.negative?, "#{value.class}:(#{value}) should be negative!"
  end

  def notNegativeTest value
    assertNot value.negative?, "#{value.class}:(#{value}) should not be negative!"
  end
end
