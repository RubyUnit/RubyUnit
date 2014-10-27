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
      # The list of Test Cases that have been run are are currently running
      @@test_cases  = []
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
        Report.status
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
        Report.errors
        Report.skips
        Report.incompletes
        Report.failures
        Report.stats
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
