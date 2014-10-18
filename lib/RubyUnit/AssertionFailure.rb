module RubyUnit
  #
  # Exception that is raised when a test assertion fails.
  #
  class AssertionFailure < StandardError
    attr_reader :data

    # Error messages
    FAILING = 'Failing test'

    def initialize data = {}, message
      raise ArgumentError, 'Data for AssertionFailure must be a Hash' unless data.is_a? Hash
      @data = data
    end

    def info
    end
  end
end
