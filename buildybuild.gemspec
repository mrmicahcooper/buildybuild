# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'buildybuild/version'

Gem::Specification.new do |gem|
  gem.name          = "buildybuild"
  gem.version       = Buildybuild::VERSION
  gem.authors       = ["Hashrocket Workstation"]
  gem.email         = ["dev@hashrocket.com"]
  gem.description   = %q{Generators for adding a CMS your site}
  gem.summary       = %q{Create a cms that is not behind the scenes}
  gem.homepage      = "https://github.com/mrmicachooper/buildybuild"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "formal"
  gem.add_runtime_dependency "decent_exposure", "2.0.0.rc1"
  gem.add_runtime_dependency "haml-rails"
  gem.add_runtime_dependency "rdiscount"

end
