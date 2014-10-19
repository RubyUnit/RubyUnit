#
# A Simple Unit Test Framework for Ruby
#
# The RubyModule is the root object for all RubyUnit modules and classes.
#
module RubyUnit
  # Debug mode
  @@debug            = false
  INVALID_DEBUG_MODE = 'Debug mode must be Boolean'

  # Current RubyUnit version
  VERSION = '0.3.16'

  #
  # Set debug mode
  # * raises ArgumentError if _bool_ is not a Boolean
  #
  # bool::
  #   New value for debug mode
  #
  def self.debug= bool
    raise ArgumentError, INVALID_DEBUG_MODE unless [true, false].include? bool
    @@debug = bool
  end

  #
  # Get the current debug mode
  #
  def self.debug
    @@debug
  end

  #
  # RubyUnit::GemInfo contains data and functionality needed by the gem builder
  # when building and distributing the RubyUnit gem.
  #
  module GemInfo
    FILES       = ['README.md', 'LICENSE.md'] +  # base files at root level
                  Dir['lib/**/*.rb']          +  # library files
                  Dir['example/*.rb']         +  # example files
                  ['TestSuite.rb']            +  # Test Suite
                  Dir['tests/**/*.rb']           # TESTS

    DESCRIPTION = 'Unit testing and test-driven development are crucial parts of '  +
                  'the software development life cycle. This tool is intended to '  +
                  'make development and testing in Ruby easier on everyone. RubyUnit ' +
                  'is also designed to with a focus on data-driven testing.'
  end
end

require_relative 'RubyUnit/TestCase'
require_relative 'RubyUnit/Runner'

# Automatically Run Test Cases if they haven't been run already
Module.new do
  #
  # Automatically run defined Test Cases
  #
  #--
  # TODO: add alias and call the alias so that the function doesn't break any
  # functionality that may have also extended this event.  Before/After?
  # * Test and see if I even need to do that.
  #++
  #
  at_exit do
    # Don't run if it there is an exception or it has already been run
    if $ERROR_INFO.nil? and RubyUnit::Runner.autorun?
      RubyUnit::Runner.run
    end
  end
end
