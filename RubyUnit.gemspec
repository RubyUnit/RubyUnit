Gem::Specification.new do |s|
  s.name        = 'RubyUnit'
  s.version     = '0.0.1'
  s.date        = '2014-10-11'
  s.summary     = 'Unit Test Framework'
  s.description = 'Unit Test Framework'
  s.authors     = ['Matthew Clower']
  s.emails      = ['matthewclower@gmail.com']
  # Static files
  s.files       = ['README.md', 'LICENSE']
  # lib files
  s.files      += Dir.glob 'lib/**/*.rb'
  # example files
  s.files      += Dir.glob 'example/**/*.rb'
  s.homepage    = ['http://github.com/RubyUnit/RubyUnit']
  s.license     = 'LGPL'
end
