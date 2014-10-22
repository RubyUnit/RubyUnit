# Load path so that local is used even if RubyUnit is installed
$LOAD_PATH.unshift (File.dirname(__FILE__) + '/lib')

# main RubyUnit module
require 'RubyUnit'

# Validate the package is good.
# This is just the example test the real ones aren't fleshed out.
require_relative 'example/TestSet'

# RubyUnit Test Suite
require_relative 'TestSuite'

# Only build gem if the tests had no Failures/Errors
if RubyUnit::Runner.run.zero?
  Gem::Specification.new do |spec|
    # REQUIRED ATTRIBUTES
    spec.author                = 'Matthew Clower'
    spec.authors               = ['Matthew Clower']

    # required files
    spec.files                 = RubyUnit::GemInfo::FILES

    spec.name                  = 'rubyunit'
    spec.require_paths         = ['lib']
    spec.summary               = 'A Simple Unit Test Framework'
    spec.version               = RubyUnit::VERSION

    # RECOMMENDED ATTRIBUTES
    spec.licenses              = ['Ruby']
    spec.rdoc_options          = ['--all', '--main', 'README.md']
    # OPTIONAL ATTRIBUTES
    spec.description           = RubyUnit::GemInfo::DESCRIPTION
    spec.email                 = ['matthewclower@gmail.com']
    spec.extra_rdoc_files      = ['README.md']
    spec.homepage              = 'http://github.com/RubyUnit/RubyUnit'
    spec.metadata              = {'Issue_Tracker' => 'https://github.com/RubyUnit/RubyUnit/issues'}

    spec.post_install_message  = 'Happy Testing!'
    spec.required_ruby_version = '>= 1.9.2'

    spec.add_development_dependency 'rake', '>= 0'
  end
else
  puts 'Unable to build gem.'
end
