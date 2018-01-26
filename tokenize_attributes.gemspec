# coding: utf-8

$:.push File.expand_path("../lib", __FILE__)
require "tokenize_attributes/version"

Gem::Specification.new do |spec|
  spec.name          = "tokenize_attributes"
  spec.version       = TokenizeAttributes::VERSION
  spec.authors       = ["Alexandre Overtus"]
  spec.email         = ["a.overtus@live.be"]
  spec.summary       = %q{Tokenize attributes in active record object.}
  spec.description   = %q{Tokenize attributes in active record object.}
  spec.homepage      = "https://github.com/aovertus/tokenize_attributes"
  spec.license       = "MIT"

  spec.required_ruby_version     = ">= 1.9.3"
  spec.required_rubygems_version = ">= 2.0.0"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rake', '~> 10.0'
  add_development_dependency 'activerecord', '~> 4.0'
  spec.add_development_dependency 'rspec', '~> 0'
end
