lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kitchen/driver/ec2_version.rb"

Gem::Specification.new do |gem|
  gem.name          = "kitchen-ec2"
  gem.version       = Kitchen::Driver::EC2_VERSION
  gem.license       = "Apache-2.0"
  gem.authors       = ["Fletcher Nichol"]
  gem.email         = ["fnichol@nichol.ca"]
  gem.description   = "A Test Kitchen Driver for Amazon EC2"
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/test-kitchen/kitchen-ec2"

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR).grep(/LICENSE|^lib/)
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.4"

  gem.add_dependency "test-kitchen", ">= 1.4.1", "< 3"
  gem.add_dependency "aws-sdk-ec2", "~> 1.0"
  gem.add_dependency "retryable", ">= 2.0", "< 4.0" # 4.0 will need to be validated

  gem.add_development_dependency "rspec",     "~> 3.2"
  gem.add_development_dependency "countloc",  "~> 0.4"
  gem.add_development_dependency "maruku",    "~> 0.6"
  gem.add_development_dependency "yard",      ">= 0.9.11"

  # style and complexity libraries are tightly version pinned as newer releases
  # may introduce new and undesireable style choices which would be immediately
  # enforced in CI
  gem.add_development_dependency "chefstyle", "= 1.3.2"
  gem.add_development_dependency "climate_control"
end
