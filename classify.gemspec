lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'classify/version'

Gem::Specification.new do |spec|
  spec.name          = 'classify'
  spec.version       = Classify::VERSION
  spec.authors       = ['Samuel Garneau']
  spec.email         = ['sam@garno.me']
  spec.description   = 'Classify prevent your download folder from being a mess.'
  spec.summary       = 'Classify prevent your download folder from being a mess.'
  spec.homepage      = 'https://github.com/garno/classify'
  spec.license       = 'BSD 3-Clause'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
