# == RubyUnit
# RubyUnit is the base module for all classes and modules.
module RubyUnit
  #
  # = RubyUnit
  #   A Simple Unit Test Framework for Ruby
  #
  
  # RubyUnit version you are using
  VERSION = '0.0.6'

  # Module which contains data used when compiling Ruby gem
  module GemInfo

    # Provides a list of all the files required by this gem
    def self.files
      # local one-off directory
      static   = ['README.md', 'LICENSE']
      # libraries
      libs     = Dir['lib/**/*.rb']
      # examples
      examples = Dir['example/*.rb']

      static + libs + examples
    end
  end
end

require_relative 'RubyUnit/TestCase'
require_relative 'RubyUnit/Runner'

# Automatically Run Test Cases if they haven't been run already
Module.new do
  # Run autorunner
  #--
  # TODO: add alias and call the alias so that the function doesn't break any
  # functionality that may have also extended this event.  Before/After?
  #++
  at_exit do
    if $ERROR_INFO.nil? and RubyUnit::Runner.autorun?
      RubyUnit::Runner.run
    end
  end
end
