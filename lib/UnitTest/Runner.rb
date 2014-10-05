require 'UnitTest/TestCase'
require 'UnitTest/AssertionFailure'

module UnitTest
  class Runner
    protected
    @@test_cases = []
    @@failures   = []
    @@errors     = []
    @@tests      = 0

    class << self
      public
      def run
        runner = new
        TestCase.descendents.each do |object|
          @@test_cases << object

          data_methods = object.instance_methods.grep /Data\Z/
          test_methods = object.instance_methods.grep /Test\Z/

          test_methods.each do |test|
            data_method = "#{test.slice(0..-5)}Data".to_sym
            if data_methods.include? data_method
              test_case = object.new
              data      = test_case.send data_method

              raise "Data methods must return and array" unless data.is_a? Array
              data.each do |params|
                raise "Data methods must return an array of arrays" unless data.is_a? Array
                runner.run object, test, params
              end
            else
              runner.run object, test
            end
          end
        end
        report
      end

      protected
      def report
        puts @@failures
        puts @@errors
      end
    end

    public
    def run object, test, params = []
      raise ArgumentError, "Parameter list must be an array" unless params.is_a? Array

      test_case = object.new

      begin
        @@tests += 1
        test_case.setup
        test_case.send test, *params
      rescue AssertionFailure => failure
        @@failures << [test_case.class.name, test, params, failure]
      rescue Exception => e
        @@errors << [test_case.class.name, test, params, failure]
      end

      test_case.teardown
    end
  end
end
