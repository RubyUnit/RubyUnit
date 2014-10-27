module RubyUnit
  ##
  # The RubyUnit::Report module is the test results report
  #
  module Report
    @@results    = []
    @@fail       = []
    @@skip       = []
    @@incomplete = []
    @@errors     = []

    def self.record result
      @@results << result

      case result.error.class
      when AssertionFailure
        @@fail << result
      when SkippedTest
        @@skip << result
      when IncompleteTest
        @@incomplete << result
      else
        if result.error.class <= Exception
          @@errors << result
        end
      end
    end
end
