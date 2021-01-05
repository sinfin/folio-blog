# frozen_string_literal: true

$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "folio/blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "folio-blog"
  s.version = Folio::Blog::VERSION
  s.authors = ["Sinfin"]
  s.email = ["info@sinfin.cz"]
  s.homepage = "http://sinfin.digital"
  s.summary = "Summary of Folio blog."
  s.description = "Description of Folio blog."
  s.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.4"

  s.add_development_dependency "pg"

  s.add_development_dependency "pry-rails"
  s.add_development_dependency "annotate"
  s.add_development_dependency "better_errors"
  s.add_development_dependency "binding_of_caller"
  s.add_development_dependency "puma"
  s.add_development_dependency "faker"

  s.add_development_dependency "guard-rubocop"
  s.add_development_dependency "guard-slimlint"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "rubocop-minitest"
  s.add_development_dependency "rubocop-performance"
  s.add_development_dependency "rubocop-rails"
  s.add_development_dependency "rubocop-rails_config"
  s.add_development_dependency "rubocop-rake"
end
