module RubyUnit
  #
  # module containing text for assertion errors and messages
  #
  module AssertionMessage
    # Error messages
    FAILING = 'Failing test'
    FAILURE = 'Failed to ASSERT'

    # Basic assertions
    ASSERT_ERROR       = 'Value IS NOT false OR nil'
    ASSERT_NOT_ERROR   = 'Value IS false OR nil'
    ASSERT_TRUE_ERROR  = 'Value IS EXACLTY true' 
    ASSERT_FALSE_ERROR = 'Value IS EXACLTY false'
    ASSERT_NIL_ERROR   = 'Value IS EXACTLY nil'
  end

  #
  # Exception that is raised when a test assertion fails.
  #
  class AssertionFailure < StandardError
    include AssertionMessage
    attr_reader :data
    #
    # Create a RubyUnit::AssertionFailure exception
    #
    # data::
    #   The data associated with the assertion
    #
    def initialize data = {}
      raise ArgumentError, 'Data for AssertionFailure must be a Hash' unless data.is_a? Hash
      @data = data
    end

    #
    # Create a string from the assertion data
    #
    def info
      s = "\n"
      s = "#{FAILURE}: #{message}\n" if message.length > 0
      @data.each do |key, value|
        s << "\n#{key}:\n\t#{value.inspect}"
      end
      s
    end
  end
end
