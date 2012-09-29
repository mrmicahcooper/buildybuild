# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'buildybuild/version'

Gem::Specification.new do |gem|
  gem.name          = "buildybuild"
  gem.version       = Buildybuild::VERSION
  gem.authors       = ["Hashrocket Workstation"]
  gem.email         = ["dev@hashrocket.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "decent_exposure", '2.0.0.rc1'
  gem.add_dependency "formal"
  gem.add_dependency "haml-rails"
  gem.add_dependency "rdiscount"

end
