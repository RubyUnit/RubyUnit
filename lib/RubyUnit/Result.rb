module RubyUnit
  ##
  # The RubyUnit::Result class is a result of individual tests
  #
  class Result
    attr_accessor :error

    @test_case
    @test
    @params
    @error

    def initialize test_case, test, params = [], error = nil
      raise TypeError, "Test Case name must be a RubyUnit::TestCase, got #{test_case.class}" unless test_case <= RubyUnit::TestCase
      raise TypeError, "Test must be a symbol, got #{test.class}" unless test.is_a? Symbol
      raise TypeError, "Test Parameters must be an Array, got #{params.class}" unless params.is_a? Array
      raise TypeError, "Error must be an Exception or nil, got #{error.class}" unless error.nil? or error <= Exception

      @test_case = test_case
      @test      = test
      @params    = params
      @error     = error

      # Automatically add result to the test results...
      Report.record self
    end
  end
end
