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
      raise TypeError, 'Data for AssertionFailure must be a Hash' unless data.is_a? Hash
      @data = data
    end

    ##
    # Create a string from the assertion data
    #
    def info
      info = []
      info << message if message.length > 0
      @data.each do |key, value|
        info << ":#{key} => #{value.inspect}"
      end
      info.join "\n"
    end
  end
end
