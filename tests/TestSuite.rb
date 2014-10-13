#!/usr/bin/env ruby

# IMPORTANT
# require relative RubyUnit framework for local so that the tests are run on the build
# in this repository
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib") if not ARGV.include? '--gem'

require 'RubyUnit'

# Test Cases

# Ruby module => lib/RubyUnit.rb
require_relative 'TEST_RubyUnit'

# GemInfo module => lib/RubyUnit.rb
require_relative 'TEST_GemInfo'