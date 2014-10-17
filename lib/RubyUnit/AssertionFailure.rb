module RubyUnit
  #
  # Exception that is raised when a test assertion fails.
  #
  class AssertionFailure < StandardError
    # Error messages
    FAILING = 'Failing test'

  end
end
