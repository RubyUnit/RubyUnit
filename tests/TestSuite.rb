#!/usr/bin/env ruby

# IMPORTANT
# require relative RubyUnit framework for local so that the tests are run on the build
# in this repository
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib") if not ARGV.include? '--gem'

require 'RubyUnit'

# Test Cases

# RubyUnit module => RubyUnit.rb
require_relative 'TEST_RubyUnit'
require_relative 'TEST_GemInfo'

# AssertionFailure exception => RubyUnit/AssertionFailure.rb
require_relative 'TEST_AssertionFailure'

# Assertions module => RubyUnit/Assertions.rb
require_relative 'TEST_Assertions'

# IncompleteTest exception => RubyUnit/IncompleteTest.rb
require_relative 'TEST_IncompleteTest'

# Runner class => RubyUnit/Runner.rb
require_relative 'TEST_Runner'

# SkippedTest exception => RubyUnit/SkippedTest.rb
require_relative 'TEST_SkippedTest'

# TestCase class => RubyUnit/TestCase.rb
require_relative 'TEST_TestCase'
