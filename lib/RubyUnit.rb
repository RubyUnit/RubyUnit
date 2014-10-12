module RubyUnit
  @@build = 6
  VERSION = '0.0'

  protected
  public
  def self.debug?
    @@debug
  end
  
  def self.build
    @@build
  end

  def self.version
    "#{VERSION}.#{build}"
  end

  class GemInfo
    class << self
      def files
        static   = ['README.md', 'LICENSE']
        libs     = Dir['lib/**/*.rb']
        examples = Dir['example/*.rb']

        static + libs + examples
      end
    end
  end
end

require_relative 'RubyUnit/TestCase'
require_relative 'RubyUnit/Runner'

# Automatically run test cases
Module.new do
  at_exit do
    if $ERROR_INFO.nil? and RubyUnit::Runner.autorun?
      RubyUnit::Runner.run
    end
  end
end
