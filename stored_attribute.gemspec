# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "stored_attribute/version"

Gem::Specification.new do |s|
  s.name        = "stored_attribute"
  s.version     = StoredAttribute::VERSION
  s.authors     = ["Arjen Oosterkamp"]
  s.email       = ["mail@arjen.me"]
  s.homepage    = ""
  s.summary     = %q{Type casting stored attributes for ActiveRecord}
  s.description = %q{Type casting stored attributes for ActiveRecord}

  s.rubyforge_project = "stored_attribute"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.3"

  s.add_development_dependency "sqlite3"

  s.add_dependency "activerecord", "~> 3.0"
end
