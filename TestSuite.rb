#!/usr/bin/env ruby

# require relative RubyUnit framework for local so that the tests are run on the build
# in this repository
path = File.dirname(__FILE__)

$LOAD_PATH.unshift("#{path}/lib") if not ARGV.include? '--gem'
$LOAD_PATH.unshift("#{path}/tests")

require 'RubyUnit'

# Test Sets

# RubyUnit module => RubyUnit.rb
require 'TS_RubyUnit'

# AssertionFailure exception => RubyUnit/AssertionFailure.rb
require 'TS_AssertionFailure'

# Assertions module => RubyUnit/Assertions.rb
require 'TS_Assertions'

# IncompleteTest exception => RubyUnit/IncompleteTest.rb
require 'TS_IncompleteTest'

# Runner class => RubyUnit/Runner.rb
require 'TS_Runner'

# SkippedTest exception => RubyUnit/SkippedTest.rb
require 'TS_SkippedTest'

# TestCase class => RubyUnit/TestCase.rb
require 'TS_TestCase'
