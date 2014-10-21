module AssertionFailureTests
  ##
  # Data provider for RubyUnit::AssertionFailure Class Test Case
  #
  module ClassData
    def isDescendentData
      [
        [    Exception],
        [StandardError],
      ]
    end
  end
end
