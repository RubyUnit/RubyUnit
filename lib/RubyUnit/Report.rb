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

    def self.report_errors
      report 'Errors in Tests', @@errors
    end

    def self.report_failures
      report 'Failed Tests', @@fail
    end

    def self.report_skips
      report 'Skipped Tests', @@skip, false
    end

    def self.report_incompletes
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

    def self.report_timed
      timed_stats.each do |key, duration|
        puts "#{key} in #{duration} seconds"
      end
    end

    def self.timed_stats
      timed = {}
      timed['Tests Completed'] = @@finish - @@start
      timed
    end

    def self.report_rated
      s = ''
      rated_stats.each do |rated, count|
        s << "%.3f #{rated}/s" % [per_second(count)]
        s << ', ' unless rated_stats.keys.last == rated
      end
      puts s
    end

    def self.rated_stats
      rated = {}
      rated['Tests']      = tests
      rated['Assertions'] = TestCase.assertions
      rated
    end

    def self.report_counted
      s = ''
      counted_stats.each do |counted, count|
        s << "#{count} #{counted}"
        s << ', ' unless counted_stats.keys.last == counted
      end
      puts s
    end

    def self.counted_stats
      counted                     = rated_stats.clone
      counted['Skipped Tests']    = @@skip.count unless @@skip.count.zero?
      counted['Incomplete Tests'] = @@incomplete.count unless @@incomplete.count.zero?
      counted['Failed Tests']     = @@fail.count
      counted
    end

    def self.report_stats
      puts
      report_timed
      report_rated
      report_counted
    end

    def self.stats
      {:timed=>timed_stats,:rate=>rated_stats,:count=>counted_stats}
    end
  end
end
