#!/usr/bin/env ruby

# require relative RubyUnit framework for local so that the tests are run on the build
# in this repository
path = File.dirname(__FILE__)

$LOAD_PATH.unshift("#{path}/lib") if not ARGV.include? '--gem'

require 'RubyUnit'

# Automatically load Test Sets
Dir['tests/TS_*.rb'].each do |test_case|
  require_relative test_case
end
