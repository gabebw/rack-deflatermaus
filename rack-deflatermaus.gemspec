# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/deflatermaus/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-deflatermaus"
  spec.version       = Rack::Deflatermaus::VERSION
  spec.authors       = ["Gabe Berke-Williams"]
  spec.email         = ["gabebw@gabebw.com"]
  spec.summary       = %q{Play a selection from Die Fledermaus with every request.}
  spec.homepage      = "https://github.com/gabebw/rack-deflatermaus"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "audite", "~> 0.4.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
