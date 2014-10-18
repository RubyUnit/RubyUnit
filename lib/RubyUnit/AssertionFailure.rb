module RubyUnit
  #
  # module containing text for assertion errors and messages
  #
  module AssertionMessage
    # Error messages
    FAILING = 'Failing test'
    FAILURE = 'Failed to ASSERT'

    # Basic assertions
    ASSERT_ERROR         = 'Value IS NOT false OR nil'
    ASSERT_NOT_ERROR     = 'Value IS false OR nil'
    ASSERT_TRUE_ERROR    = 'Value IS EXACLTY true' 
    ASSERT_FALSE_ERROR   = 'Value IS EXACLTY false'
    ASSERT_NIL_ERROR     = 'Value IS EXACTLY nil'
    ASSERT_NOT_NIL_ERROR = 'Value IS NOT nil'

    # Comparison assertions
    ASSERT_EQUAL_ERROR              = 'Objects ARE equal'
    ASSERT_NOT_EQUAL_ERROR          = 'Objects ARE NOT equal'
    ASSERT_GREATERTHAN_ERROR        = 'Object IS greater than expected'
    ASSERT_GREATERTHANOREQUAL_ERROR = 'Object IS greater than OR equal to expected'
    ASSERT_LESSTHAN_ERROR           = 'Object IS less than expected'
    ASSERT_LESSTHANOREQUAL_ERROR    = 'Object IS less than OR equal to expected'
    ASSERT_MATCH_ERROR              = 'Value matches Regexp'
    ASSERT_NOT_MATCH_ERROR          = 'Value does NOT match Regexp'
    ASSERT_SAME_ERROR               = 'Objects ARE the same'
    ASSERT_NOT_SAME_ERROR           = 'Objects ARE NOT the same'
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
