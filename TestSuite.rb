#!/usr/bin/env ruby

# require relative RubyUnit framework for local so that the tests are run on the build
# in this repository
path = File.dirname(__FILE__)

$:.unshift("#{path}/lib") unless ARGV.include? '--gem'

require 'RubyUnit'

RubyUnit.debug = true if ARGV.include? '--debug'
RubyUnit::Report.trace = false if ARGV.includ? '--no-trace'

# Automatically load Test Sets
RubyUnit::TestSuite.new Dir['tests/TS_*.rb']
