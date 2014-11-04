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

    @@i          = 0
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

    def self.report_head result
      puts
      puts "#{@@i += 1}) #{result.test_case}::#{result.test}(#{result.params})"
      puts result.error.class.to_s + ": " + result.error.message
    end

    def self.report_info result, trace = true
      puts
      puts result.error.info if result.error.respond_to? :info
      puts result.error.backtrace * "\n" if trace
    end

    def self.report type, results = [], trace = true
      @@i = 0
      puts "\n#{results.count} #{type}:\n" if results.count > 0
      results.each_with_index do |result, i|
        report_head result
        report_info result, trace
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

    def self.per_second count
      return 0 if @@start.nil?
      finish  = @@finish.nil? ? Time.new : @@finish
      elapsed = (finish - @@start).to_r
      (count * (Rational(elapsed.denominator, elapsed.numerator))).to_f
    end

    def self.stats
      puts
      puts "Tests Complete in #{@@finish - @@start} seconds!"
      puts "%.3f tests/s, %.3f assertions/s" % [per_second(tests), per_second(TestCase.assertions)]
      puts "%d Assertions, %d Skipped Tests, %d Incomplete Tests" % [TestCase.assertions, @@skip.count, @@incomplete.count]
      puts "%d Tests, %d Errors, %d Failures" % [tests, @@errors.count, @@fail.count]
      puts
    end
  end
end
