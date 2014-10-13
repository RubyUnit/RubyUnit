#
# = RubyUnit
# A Simple Unit Test Framework for Ruby
#
# The RubyModule is the root object for all RubyUnit modules and classes.
#
module RubyUnit
  # Current RubyUnit version
  VERSION = '0.1.8'

  #
  # RubyUnit::GemInfo contains data and functionality needed by the gem builder
  # when building and distributing the RubyUnit gem.
  #
  module GemInfo

    #
    # Provides a list of all the files required by this gem
    #
    #  spec.files = RubyUnit::GemInfo.files
    #
    def self.files
      # local one-off directory
      static   = ['README.md']
      # libraries
      libs     = Dir['lib/**/*.rb']
      # examples
      examples = Dir['example/*.rb']

      static + libs + examples
    end

    #
    # Provides a longer description of the RubyUnit gem
    #
    #  spec.description = RubyUnit::GemInfo.description
    #
    def self.description
      'Unit testing and test-driven development is a crucial part of the software ' +
      'development life cycle. This tool is intended to make development and ' +
      'testing in Ruby easier on everyone.'
    end
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
  #++
  #
  at_exit do
    # Don't run if it there is an exception or it has already been run
    if $ERROR_INFO.nil? and RubyUnit::Runner.autorun?
      RubyUnit::Runner.run
    end
  end
end
