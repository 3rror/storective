# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'storective/version'

Gem::Specification.new do |spec|
  spec.name          = "storective"
  spec.version       = Storective::VERSION
  spec.authors       = ["Gianluca Andreotti"]
  spec.email         = ["gianlucaatlas (at) gmail (com)"]
  spec.summary       = %q{Ruby wrapper for the Apple Search API}
  spec.description   = %q{Ruby wrapper for the Apple Search API. It makes easy searching for movies, podcasts, music, music videos, audio books, short films, tv shows, softwares and ebooks on the iTunes Store, App Store, iBook Store and Mac App Store by term or by id.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "codeclimate-test-reporter"
end
