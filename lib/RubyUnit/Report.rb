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

      case result.error
      when RubyUnit::AssertionFailure
        @@fail << result
      when RubyUnit::SkippedTest
        @@skip << result
      when RubyUnit::IncompleteTest
        @@incomplete << result
      else
        if result.error.class <= Exception
          puts "error #{result.error.class}"
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

    def self.report type, results = [], trace = true
      puts "\n#{results.count} #{type}:\n" if results.count > 0
      results.each_with_index do |result, i|
        puts "\n#{i + 1}) #{result.test_case}::#{result.test}(#{result.params})"
        puts "#{result.error.class}: #{result.error.message}"
        puts result.error.backtrace * "\n" if trace
      end
    end

    def self.errors
      report 'Errors in Tests', @@errors
    end

    def self.failures
      report 'Failed Tests', @@fail
    end

    def self.skips
      report 'Skipped Tests', @@skip, false
    end

    def self.incompletes
      report 'Incomplete Tests', @@incomplete, false
    end

    def self.status
      @@fail.count + @@errors.count
    end

    def self.stats
      elapsed  = @@finish - @@start
      inverse  = Rational(elapsed.to_r.denominator,elapsed.to_r.numerator)
      puts
      puts "Tests Complete in #{elapsed} seconds!"
      puts "%.3f tests/s, %.3f assertions/s" % [(tests * inverse).to_f, (TestCase.assertions * inverse).to_f]
      puts "%d Assertions, %d Skipped Tests, %d Incomplete Tests" % [TestCase.assertions, @@skip.count, @@incomplete.count]
      puts "%d Tests, %d Errors, %d Failures" % [tests, @@errors.count, @@fail.count]
      puts
    end
  end
end
