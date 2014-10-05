require 'UnitTest/AssertionFailure'

module UnitTest
  class TestCase
    @@assertions = 0
    
    public
    def setup
    end

    def teardown
    end

    private
    def assertion &block
      @assertions += 1
    end

    protected
    def fail message = nil
      raise AssertionFailure, message
    end

    def assert expected, message = nil
      raise AssertionFailure, message unless expected
    end

    def assertEqual expected, actual, message = nil
      raise AssertionFailure, message unless expected == actual
    end

    def assertMatch pattern, actual, message = nil
      raise AssertionFailure, message unless actual =~ pattern
    end

    def assertRaiseExpected *args, &block
      raise ArgumentError, "wrong number of arguments (#{args.count} for 2..3)" unless args.count >= 1 
      expected, pattern, message = args
      raise ArgumentError, "expected exception must be a subclass of Exception" unless expected < Exception
      raise ArgumentError, "exception message must be a Regexp or String" unless pattern.is_a? Regexp or pattern.is_a? String or pattern.nil?
      raise ArguemntError, "message must be a String or nil" unless message.is_a? String or message.nil?

      begin
        yield
        raise AssertionFailure, message
      rescue expected => e
        if pattern.is_a? String
          assertEqual pattern, e.message
        elsif pattern.is_a? Regexp
          assertMatch pattern, e.message
        end
      end
    end

    def assertInstance instance, object, message
      raise AssertionFailure, message unless object.instance_of? instance
    end

    class << self
      def descendents
        ObjectSpace.each_object(Class).select do |object|
          object < self
        end
      end
    end
  end
end