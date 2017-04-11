lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Maintain your gem's version:
require 'hg/assistant/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name          = 'hg-assistant'
  spec.version       = Hg::Assistant::VERSION
  spec.authors       = ['Matt Buck']
  spec.email         = ['matt@voxable.io']

  spec.summary       = 'Extensions to Hg for building Actions on Google.'
  spec.homepage      = 'https://rubygems.org/hg-assistant'
  # TODO: Add description
  # spec.description   =
  spec.license       = 'MIT'

  spec.test_files    = Dir['spec/**/*']
  spec.files         = Dir[
    '{app,bin,config,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md'
  ]

  spec.require_paths = ['lib']

  #spec.add_dependency 'hg', '~> 0.1.0'
  spec.add_dependency 'dry-configurable', '~> 0.6.2'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.5.2'
  spec.add_development_dependency 'sqlite3', '~> 1.3.11'
  spec.add_development_dependency 'rubocop', '~> 0.48.0'
end
