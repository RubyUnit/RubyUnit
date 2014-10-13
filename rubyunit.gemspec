# Load path so that local is used even if RubyUnit is installed
$LOAD_PATH.unshift (File.dirname(__FILE__) + '/lib')

# main RubyUnit module
require 'RubyUnit'

# Validate the package is good.
require_relative 'example/TestSet'

if RubyUnit::Runner.run.zero?
  Gem::Specification.new do |spec|
    # REQUIRED ATTRIBUTES
    spec.author                = 'Matthew Clower'
    spec.authors               = ['Matthew Clower']

    # required files
    spec.files                 = RubyUnit::GemInfo.files

    spec.name                  = 'rubyunit'
    spec.require_paths         = ['lib']
    spec.summary               = 'A Simple Unit Test Framework'
    spec.version               = RubyUnit::VERSION

    # RECOMMENDED ATTRIBUTES
    spec.licenses              = 'LGPL'
    spec.licenses              = ['LGPL']

    # OPTIONAL ATTRIBUTES
    spec.description           = RubyUnit::GemInfo.description
    spec.email                 = ['matthewclower@gmail.com']
    spec.extra_rdoc_files      = ['README.md']
    spec.homepage              = 'http://github.com/RubyUnit/RubyUnit'
    spec.metadata              = {'Issue Tracker' => 'https://github.com/RubyUnit/RubyUnit/issues'}

    spec.post_install_message  = 'Happy Testing!'
    spec.required_ruby_version = '~> 2.0'
  end
else
  puts 'Unable to build gem.'
end
