require "rake"

#!/usr/bin/env ruby

# require relative RubyUnit framework for local so that the tests are run on the build
# in this repository
path = File.dirname(__FILE__)

$LOAD_PATH.unshift("#{path}/lib") unless ARGV.include? '--gem'

require 'RubyUnit'

RubyUnit.debug = true if ARGV.include? '--debug'

# Automatically load Test Sets

task :spec do
  desc "Run tests"
  Dir['tests/TS_*.rb'].each do |test_set|
		puts "Adding Test Set #{test_set}" if RubyUnit.debug
		require_relative test_set
	end
end

task :default => [:spec]