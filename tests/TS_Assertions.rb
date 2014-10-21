#!/usr/bin/env ruby

require 'RubyUnit'

module AssertionsTests
  ##
  # Messages to be used in the tests
  #
  MESSAGE = [
    [ 'AssertionsTests Assertion Message'],
  ]

  class AssertionsTestCase < RubyUnit::TestCase
    include RubyUnit::AssertionMessage

    ##
    # Keep count of assertions
    @assertions

    ##
    # Setup tests
    #
    def setup
      @assertions = RubyUnit::TestCase.assertions
    end

    ##
    # Teardown tests
    # * All tests on Assertions should add to the assertion count
    #
    def teardown
      assertGreaterThan @@assertions, @assertions, 'Test should make assertions'
    end

    ##
    # Wrapper to rescue assertions
    #
    def rescue_assertion pattern = '', message = nil, data = {}, &block
      failure = assertRaiseExpected RubyUnit::AssertionFailure, pattern, message do
        yield
      end
      info = failure.info
      assertMatch /#{message}/, info, 'Assertion failure message mismatch'
      data.each do |key, value|
        assertMatch [/#{key}/, /#{value.inspect}/], info, 'Expected failure info not found'
      end
    end

    ##
    # Add parameter on the end of each param list
    def add_parameter array, params = MESSAGE
      a = []
      params.each do |param|
        a = a + array.collect {|element| element.clone + param}
      end
      a
    end
  end
end

# Test Cases
Dir["#{File.dirname(__FILE__)}/Assertions/TC_*.rb"].each do |test_case|
  puts "Adding Test Case #{test_case}" if RubyUnit.debug
  require test_case
end
