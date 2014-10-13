require_relative 'TestCase'
require_relative 'AssertionFailure'

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
      @@test_cases = []
      # The list of RubyUnit::AssertionFailure exceptions that were caught by the
      # test runner during testing
      @@failures   = []
      # The list of non RubyUnit::AssertionFailure exceptions that were caught by
      # the test runner during testing
      @@errors     = []
      # The total number of tests that have been run
      @@tests      = 0
      # The time the tests were started
      @@start      = nil
      # The time the tests completed
      @@finish     = nil
      # Whether or not the test suite still needs to be run. This is used by the
      # automatic runner to determine if it must be run before the program exits.
      @@autorun    = true

      public
      #
      # The static test runner
      # * raises ArgumentError if any data method doesn't return an array
      # * raises ArgumentError if any data method doesn't return an array of arrays
      # * Returns the sum of the failure and error counts
      #
      #  RubyUnit::Runner.run
      #
      def run
        @@autorun = false
        @@start   = Time.new
        runner    = new
        TestCase.descendents.each do |object|
          @@test_cases << object

          data_methods = object.instance_methods.grep /Data\Z/
          test_methods = object.instance_methods.grep /Test\Z/

          test_methods.each do |test|
            data_method = "#{test.slice(0..-5)}Data".to_sym
            if data_methods.include? data_method
              test_case = object.new
              data      = test_case.send data_method

              raise ArgumentError, "Data method #{data_method} must return an array" unless data.is_a? Array
              data.each do |params|
                raise ArgumentError, "Data method #{data_method} must return an array of arrays" unless data.is_a? Array
                runner.run object, test, params
              end
            else
              runner.run object, test
            end
          end
        end
        @@finish = Time.new
        report unless @@tests.zero?
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
        puts "RubyUnit #{RubyUnit::VERSION}"
        puts "Started Tests #{@@start.strftime("%Y-%m-%d %H:%M:%S")}"

        puts "#{@@errors.count} Errors:\n" if @@errors.count > 0
        @@errors.each_with_index do |error, i|
          puts "#{i + 1}) #{error[0]}::#{error[1]}(#{error[2]})"
          puts error[3].message
          puts error[3].backtrace.join("\n")
        end

        puts "#{@@failures.count} Failures:\n" if @@failures.count > 0
        @@failures.each_with_index do |failure, i|
          puts "#{i + 1}) #{failure[0]}::#{failure[1]}(#{failure[2]})"
          puts failure[3].message
          puts failure[3].backtrace.join("\n")
        end
        
        elapsed  = @@finish - @@start
        inverse  = Rational(elapsed.to_r.denominator,elapsed.to_r.numerator)
        puts
        puts "Tests Complete in #{elapsed} seconds!"
        puts "%.3f tests/s, %.3f assertions/s" % [(@@tests * inverse).to_f, (TestCase.assertions * inverse).to_f]
        puts "%d Tests, %d Assertions, %d Errors, %d Failures" % [@@tests, TestCase.assertions, @@errors.count, @@failures.count]
        puts
      end
    end

    public
    #
    # Run a test and record the results. The test object is instantiated and
    # RubyUnit::TestCase.setup is called. RubyUnit::TestCase.teardown is called
    # after the test has finished. This is called by the static runner.
    # * raises ArgumentError unless _params_ is an Array
    #
    # object::
    #   The test case that has the test
    #
    # test::
    #   The test that is going to be run
    #
    # params::
    #   The parameters that are passed to test execution
    #
    #  run TestCaseClass, :myTest, [param1, param2]
    #
    def run object, test, params = []
      raise ArgumentError, "Parameter list for #{object.class}::#{test} must be an array" unless params.is_a? Array

      test_case = object.new

      begin
        @@tests += 1
        test_case.setup
        test_case.send test, *params
      rescue AssertionFailure => failure
        @@failures << [test_case.class.name, test, params, failure]
      rescue Exception => error
        @@errors << [test_case.class.name, test, params, error]
      ensure
        test_case.teardown
      end
    end
  end
end
