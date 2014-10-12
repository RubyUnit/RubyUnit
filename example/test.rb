#!/usr/bin/env ruby

# Add load path until I have the gem working
$LOAD_PATH << "#{File.dirname(__FILE__)}/../lib"

# Sample Test
require 'RubyUnit'
require_relative 'RealNumberTest'
