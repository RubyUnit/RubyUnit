module RubyUnit
  #
  # Exception that is raised when a test assertion fails.
  #
  class AssertionFailure < StandardError
    attr_reader :data

    # Error messages
    FAILING           = 'Failing test'
    FAILURE           = 'Failed to ASSERT'

    # Basic assertions
    ASSERT_ERROR      = 'Value IS NOT false or nil'
    ASSERT_NOT_ERROR  = 'Value IS false or nil'
    ASSERT_TRUE_ERROR = 'Value IS true' 

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
      @data.each do |index, value|
        s << "\n#{index}:\n\t#{value.inspect}"
      end
      s
    end
  end
end
