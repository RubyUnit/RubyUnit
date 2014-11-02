#!/usr/bin/env ruby

require 'RubyUnit'

# Test Cases
RubyUnit::TestSet.new Dir["#{File.dirname(__FILE__)}/SkippedTest/TC_*.rb"]