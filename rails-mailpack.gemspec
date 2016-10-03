# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails/mailpack/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-mailpack"
  spec.version       = Rails::Mailpack::VERSION
  spec.authors       = ["Jakob Skjerning"]
  spec.email         = ["jakob@mentalized.net"]

  spec.summary       = %q{A few battle-tested tricks to make Rails emails manageable}
  spec.description   = %q{Rails makes emails easy, but email is never as easy it seems. These are a few battle-tested tricks we have learned that makes emails manageable}
  spec.homepage      = "https://github.com/substancelab/rails-mailpack"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
