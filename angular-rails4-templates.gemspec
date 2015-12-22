# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "angular-rails4-templates/version"

Gem::Specification.new do |s|
  s.name        = "angular-rails4-templates"
  s.version     = AngularRails4Templates::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Damien Mathieu", 'pitr', 'whitehat101', "Chris Nelson"]
  s.email       = ["chris@gaslight.co"]
  s.homepage    = "https://github.com/gasligh/angular-rails4-templates"
  s.summary     = "Use your angular templates with rails4/sprockets3 asset pipeline"

  s.files = %w(README.md LICENSE) + Dir["lib/**/*", "app/**/*"]
  s.license = 'MIT'

  s.require_paths = ["lib"]

  s.add_dependency "railties", ">= 4"
  s.add_dependency "sprockets", "~> 3"

  s.add_development_dependency "minitest"
  s.add_development_dependency "capybara"
  s.add_development_dependency "uglifier"
  s.add_development_dependency "haml"
end
