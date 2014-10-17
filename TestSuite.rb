#!/usr/bin/env ruby

# IMPORTANT
# require relative RubyUnit framework for local so that the tests are run on the build
# in this repository
path = File.dirname(__FILE__)

$LOAD_PATH.unshift("#{path}/lib") if not ARGV.include? '--gem'
$LOAD_PATH.unshift("#{path}/tests")

require 'RubyUnit'

# Test Cases

# RubyUnit module => RubyUnit.rb
require 'TEST_RubyUnit'
require 'TEST_GemInfo'

# AssertionFailure exception => RubyUnit/AssertionFailure.rb
require 'TEST_AssertionFailure'

# Assertions module => RubyUnit/Assertions.rb
require 'TEST_Assertions'

# IncompleteTest exception => RubyUnit/IncompleteTest.rb
require 'TEST_IncompleteTest'

# Runner class => RubyUnit/Runner.rb
require 'TEST_Runner'

# SkippedTest exception => RubyUnit/SkippedTest.rb
require 'TEST_SkippedTest'

# TestCase class => RubyUnit/TestCase.rb
require 'TEST_TestCase'
