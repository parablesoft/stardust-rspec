$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "stardust/rspec/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "stardust-rspec"
  spec.version     = Stardust::Rspec::VERSION
  spec.authors     = ["Vic Amuso"]
  spec.email       = ["vic@parablesoft.com"]
  spec.homepage    = "https://github.com/parablesoft/stardust-rspec"
  spec.summary     = "Summary of Stardust::Rspec."
  spec.description = "Description of Stardust::Rspec."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.add_dependency "rails", ">= 5.0"
  spec.add_dependency 'rspec-expectations'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency "sqlite3"
end
