require_relative 'AssertionFailure'
require_relative 'Assertions'

module RubyUnit
  #
  # All classes derrived from the RubyUnit::TestCase will automatically be run by
  # the test runner.
  # * Test methods must currently be named ending in 'Test'
  # * Data methods must currently be named ending in 'Data'
  #   All data methods must return an array of arrays as param lists to passed to
  #   the corresponding test method.
  # * Exceptions raised in this class are generally caught by the RubyUnit::Runner
  #
  #  MyTest < RubyUnit::TestCase
  #    def simpleData
  #      [
  #        [       1,   3],
  #        ['string', nil],
  #      ],
  #    end
  #
  #    def simpleTest param1, param2
  #      # run assertions
  #    end
  #  end
  #
  class TestCase

    public

    #
    # The setup helper that is run before each test in the test case.
    #
    #  def setup
    #    # create objects, set up the scenario
    #  end
    #
    def setup
    end

    #
    # The teardown helper that is run after each test in the test case.
    #
    #  def teardown
    #    # destroy objects, clean up after yourself
    #  end
    #
    def teardown
    end

    #
    # Mark the test as skipped
    #
    #  markSkipped 'This test is being refactored'
    #
    def markSkipped message = nil
      raise SkippedTest, message
    end

    #
    # Mark the test as incomplete
    #
    #  markIncomplete 'Implementation of this test is not finished'
    #
    def markIncomplete message = nil
      raise IncompleteTest, message
    end

    protected
    include Assertions
    
    class << self
      public
      #
      # Gets a list of all the descendents of the RubyUnit::TestCase class.
      # This is important when determining the tests that have been defined.
      #
      def descendents
        ObjectSpace.each_object(Class).select do |object|
          object < self
        end
      end

      #
      # Gets the current number of assertions that have been run while testing
      #
      def assertions
        @@assertions
      end
    end
  end
end