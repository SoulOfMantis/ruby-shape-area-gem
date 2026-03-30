# frozen_string_literal: true
require_relative "lib/ruby_shapes/version"
Gem::Specification.new do |spec|
  spec.name          = "ruby_shapes"
  spec.version       = RubyShapes::VERSION
  spec.authors       = ["Maria Ligorova", "Alina Olkhovaia", "Andrey Timofeev"]

  spec.summary       = "Some shapes and solid shapes classes, that can calculate own area, volume and perimeter"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.files = Dir.glob("lib/**/*.rb") + ["README.md", "Rakefile"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 13.0"
end