#!/usr/bin/env ruby

require 'RubyUnit'

# Test Cases
Dir["#{File.dirname(__FILE__)}/SkippedTest/TC_*.rb"].each do |test_case|
  puts "Adding Test Case #{test_case}" if RubyUnit.debug
  require test_case
end
