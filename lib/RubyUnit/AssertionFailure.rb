require 'RubyUnit/AssertionMessage'

module RubyUnit
  ##
  # Exception that is raised when a test assertion fails.
  #
  class AssertionFailure < StandardError
    include AssertionMessage
    attr_reader :data

    ##
    # Create a RubyUnit::AssertionFailure exception
    #
    # data::
    #   The data associated with the assertion
    #
    def initialize data = {}
      raise ArgumentError, 'Data for AssertionFailure must be a Hash' unless data.is_a? Hash
      @data = data
    end

    ##
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
