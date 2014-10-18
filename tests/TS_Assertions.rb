#!/usr/bin/env ruby

require 'RubyUnit'

module AssertionsTests
  class AssertionsTestCase < RubyUnit::TestCase
    @@message = 'AssertionsTests Assertion Message'
    #
    # Wrapper to rescue assertions
    #
    def rescue_assertion pattern = '', message = nil, data = {}, &block
      failure = assertRaiseExpected RubyUnit::AssertionFailure, pattern, message do
        yield
      end
      info = failure.info
      assertMatch /#{pattern}/, info, 'AssertionFailure is missing pattern' if pattern.is_a? String and pattern.length > 0
      assertMatch pattern, info, 'AssertionFailure is missing pattern' if pattern.is_a? Regexp
      data.each do |index, value|
        assertMatch /#{index}/, info, "AssertionFailure is missing index #{index}"
        assertMatch /#{value.inspect}/, info, "AssertionFailure is missing value #{value.inspect}"
      end
      failure
    end
  end
end

# Test Cases
Dir["#{File.dirname(__FILE__)}/Assertions/TC_*.rb"].each do |test_case|
  puts "Adding Test Case #{test_case}" if RubyUnit.debug
  require test_case
end
