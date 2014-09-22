lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'catalog/version'

Gem::Specification.new do |spec|
  spec.name          = 'catalog'
  spec.version       = Catalog::VERSION
  spec.authors       = ['Samuel Garneau']
  spec.email         = ['sam@garno.me']
  spec.description   = 'Catalog prevents your download folder from being a mess on Mac Os X.'
  spec.summary       = 'Catalog prevents your download folder from being a mess on Mac Os X.'
  spec.homepage      = 'https://github.com/garno/catalog'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
