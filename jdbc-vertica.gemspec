# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jdbc/vertica/version'

Gem::Specification.new do |spec|
  spec.name          = "jdbc-vertica"
  spec.version       = Jdbc::Vertica::VERSION
  spec.authors       = ["takahiro.nakayama"]
  spec.email         = ["civitaspo@gmail.com"]
  spec.summary       = %q{jdbc vertica driver.}
  spec.description   = %q{jdbc vertica driver.}
  spec.homepage      = "https://github.com/civitaspo/jdbc-vertica"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
