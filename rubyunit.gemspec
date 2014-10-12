require_relative 'lib/RubyUnit/version'

Gem::Specification.new do |spec|
  # REQUIRED ATTRIBUTES
  spec.author               = 'Matthew Clower'
  spec.authors              = ['Matthew Clower']

  # static files
  spec.files                = ['README.md', 'LICENSE']
  # lib files
  spec.files               += Dir['lib/**/*.rb']
  # example files
  spec.files               += Dir['example/**/*.rb']

  spec.name                 = 'rubyunit'
  spec.require_paths        = ['lib']
  spec.summary              = 'Unit Test Framework'
  spec.version              = RubyUnit::VERSION

  # RECOMMENDED ATTRIBUTES
  spec.licenses             = 'LGPL'
  spec.licenses             = ['LGPL']

  # OPTIONAL ATTRIBUTES
  spec.description          = 'Framework for Unit Testing in Ruby'
  spec.email                = ['matthewclower@gmail.com']
  spec.extra_rdoc_files     = ['README.md']
  spec.homepage             = 'http://github.com/RubyUnit/RubyUnit'

  spec.post_install_message = 'Happy Testing!'
end
