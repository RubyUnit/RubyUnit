module RubyUnit
  #
  # Exception that is raised when a test assertion fails.
  #
  class AssertionFailure < StandardError
    # Error messages
    FAILING = 'Failing test'

    def initialize data = {}, message
      raise ArgumentError, 'Data for AssertionFailure must be a Hash' unless data.is_a? Hash
    end
  end
end
