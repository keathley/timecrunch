# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timecrunch/version'

Gem::Specification.new do |spec|
  spec.name          = "timecrunch"
  spec.version       = Timecrunch::VERSION
  spec.authors       = ["Chris Keathley"]
  spec.email         = ["spyc3r@gmail.com"]
  spec.summary       = %q{A timer for timing things that need timing}
  spec.description   = %q{A basic timing application you can use from the command line}
  spec.homepage      = "https://github.com/spyc3r/timecrunch"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor", "0.19.0"
  spec.add_runtime_dependency "terminal-notifier", "1.6.1"
  spec.add_runtime_dependency "ruby-progressbar", "1.6.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3", ">= 10.3.2"
  spec.add_development_dependency "rspec", "~> 3.0"
end
