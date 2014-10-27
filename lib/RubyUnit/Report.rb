require_relative 'Result'

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

    @@start      = nil
    @@finish     = nil

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

    def self.tests
      @@results.count
    end

    def self.start
      @@start = Time.new if @@start.nil?
      @@start
    end

    def self.finish
      @@finish = Time.new if @@finish.nil?
      @@finish
    end

    def self.stats
      elapsed  = @@finish - @@start
      inverse  = Rational(elapsed.to_r.denominator,elapsed.to_r.numerator)
      puts
      puts "Tests Complete in #{elapsed} seconds!"
      puts "%.3f tests/s, %.3f assertions/s" % [(tests * inverse).to_f, (TestCase.assertions * inverse).to_f]
      puts "%d Assertions, %d Skipped Tests, %d Incomplete Tests" % [TestCase.assertions, @@skip.count, @@incomplete.count]
      puts "%d Tests, %d Errors, %d Failures" % [tests, @@errors.count, @@fail.count]
    end
  end
end
