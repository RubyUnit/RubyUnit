module RubyUnit
  ##
  # The RubyUnit::Result class is a result of individual tests
  #
  class Result
    attr_accessor :test_case, :test, :params, :error

    @test_case
    @test
    @params
    @error

    def initialize test_case, test, params = [], error = nil
      @test_case = test_case
      @test      = test
      @params    = params
      @error     = error

      # Automatically add result to the test results...
      Report.record self
    end
  end
end
