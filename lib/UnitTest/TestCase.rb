require 'UnitTest/AssertionFailure'

module UnitTest
  class TestCase
    public
    def setup
    end

    def teardown
    end

    protected
    def assert expected, message = nil
      raise AssertionFailure, message unless expected
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