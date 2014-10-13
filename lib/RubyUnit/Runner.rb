require_relative 'TestCase'
require_relative 'AssertionFailure'

module RubyUnit
  class Runner
    class << self
      protected
      @@test_cases = []
      @@failures   = []
      @@errors     = []
      @@tests      = 0
      @@start      = nil
      @@finish     = nil
      @@autorun    = true

      public
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

              raise "Data method #{data_method} must return an array" unless data.is_a? Array
              data.each do |params|
                raise "Data method #{data_method} must return an array of arrays" unless data.is_a? Array
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

      def autorun?
        @@autorun
      end

      protected
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
