require_relative 'TestCase'
require_relative 'AssertionFailure'
require_relative 'Report'

module RubyUnit
  #
  # This is the test runner.
  # Done, and done.
  #
  class Runner
    class << self
      protected
      #--
      # Most of these variables need to be refactored.  This is made so it can
      # be used, but it's not very far along.
      #++
      # The list of Test Cases that have been run are are currently running
      @@test_cases  = []
      # The list of RubyUnit::AssertionFailure exceptions that were caught by the
      # test runner during testing
      @@failures    = []
      # The list of RubyUnit::SkippedTest exceptions that were caught by the test
      # runner during testing
      @@skips       = []
      # The list of RubyUnit::IncompleteTest exceptions that were caught by the test
      # runner during testing
      @@incompletes = []
      # The list of non RubyUnit::AssertionFailure exceptions that were caught by
      # the test runner during testing
      @@errors      = []
      # Whether or not the test suite still needs to be run. This is used by the
      # automatic runner to determine if it must be run before the program exits.
      @@autorun     = true

      public
      #
      # The static test runner
      # * raises TypeError if any data method doesn't return an array
      # * raises TypeError if any data method doesn't return an array of arrays
      # * Returns the sum of the failure and error counts
      #
      #  RubyUnit::Runner.run
      #
      def run
        @@autorun = false
        runner    = new
        puts "RubyUnit #{RubyUnit::VERSION}"
        puts "Started Tests #{Report.start.strftime("%Y-%m-%d %H:%M:%S")}"

        TestCase.descendents.each do |test_case|
          @@test_cases << test_case
          object = test_case.new
          test_case.setup

          data_methods = test_case.instance_methods.grep /Data$/
          test_methods = test_case.instance_methods.grep /Test$/

          test_methods.each do |test|
            data_method = "#{test.slice(0..-5)}Data".to_sym
            if data_methods.include? data_method
              data = object.send data_method

              raise TypeError, "Data method #{data_method} must return an array" unless data.is_a? Array
              data.each do |params|
                raise TypeError, "Data method #{data_method} must return an array of arrays" unless data.is_a? Array
                runner.run test_case, test, params
              end
            else
              runner.run test_case, test
            end
          end
          test_case.teardown
        end
        Report.finish
        report unless Report.tests.zero?
        @@failures.count + @@errors.count
      end

      #
      # Whether or not the test suite still needs to be run. This is used by the
      # automatic runner to determine if it must be run before the program exits.
      #
      #  RubyUnit::Runner.autorun?
      # 
      def autorun?
        @@autorun
      end

      protected
      #
      # Prints the report after testing has been completed.  This mehtod is protected and
      # is called by the global runner unless no tests have been run.
      #
      #  report # => nice and simple
      #
      def report
        # haven't figured out what I want to do for reporting yet but I need some results
        puts "#{@@errors.count} Errors:\n" if @@errors.count > 0
        @@errors.each_with_index do |error, i|
          puts "#{i + 1}) #{error[0]}::#{error[1]}(#{error[2]})"
          puts "#{error[3].class}: #{error[3].message}"
          puts error[3].backtrace.join("\n")
        end

        puts "#{@@skips.count} Skipped Tests:\n" if @@skips.count > 0
        @@skips.each_with_index do |skip, i|
          puts "#{i + 1}) #{skip[0]}::#{skip[1]}(#{skip[2]})"
          puts skip[3]
        end

        puts "#{@@incompletes.count} Skipped Tests:\n" if @@incompletes.count > 0
        @@incompletes.each_with_index do |incomplete, i|
          puts "#{i + 1}) #{incomplete[0]}::#{incomplete[1]}(#{incomplete[2]})"
          puts incomplete[3]
        end

        puts "#{@@failures.count} Failures:\n" if @@failures.count > 0
        @@failures.each_with_index do |failure, i|
          puts "#{i + 1}) #{failure[0]}::#{failure[1]}(#{failure[2]})"
          puts failure[3].info
          puts failure[3].backtrace.join("\n")
        end

        puts Report.stats
      end
    end

    public
    #
    # Run a test and record the results. The test object is instantiated and
    # TestCaseObject.setup is called. TestCaseObject.teardown is called after
    # the test has finished. This is called by the static runner.
    # * raises TypeError unless _params_ is an Array
    #
    # test_case_class::
    #   The test case class that has the test
    #
    # test::
    #   The test that is going to be run
    #
    # params::
    #   The parameters that are passed to test execution
    #
    #  run TestCaseClass, :myTest, [param1, param2]
    #
    def run klass, test, params = []
      raise TypeError, "Parameter list for #{object.class}::#{test} must be an array" unless params.is_a? Array
      test_case = klass.new

      error = nil
      begin
        test_case.setup
        test_case.send test, *params
        test_case.teardown
      rescue Exception => error
      end
      Result.new test_case.class, test, params, error
    end
  end
end
