
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_repository/version"

Gem::Specification.new do |spec|
  spec.name          = "activerepository"
  spec.version       = ActiveRepository::VERSION
  spec.authors       = ["Mohamed Camara GUEYE"]
  spec.email         = ["katakeynii@gmail.com"]

  spec.summary       = "Applying Repository pattern above ActiveRecord"
  spec.description   = "Adding repository pattern to above rails active record implementation"
  spec.homepage      = "https://github.com/katakeynii/activerepository"
  spec.license       = "MIT"
  spec.platform      = Gem::Platform::RUBY
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/katakeynii/activerepository"
    spec.metadata["changelog_uri"] = "https://github.com/katakeynii/activerepository"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 6.0" 
  spec.add_dependency "activerecord",  "~> 6.0"
  spec.add_dependency "activemodel", "~> 6.0"
  spec.add_dependency("orm_adapter", "~> 0.1")
  spec.add_dependency("bcrypt", "~> 3.0")
  spec.add_dependency("railties", ">= 4.1.0")
  spec.add_dependency("responders")

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "factory_bot"
  # spec.add_development_dependency 'guard-rspec'

end
