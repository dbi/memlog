# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "memlog/version"

Gem::Specification.new do |s|
  s.name        = "memlog"
  s.version     = Memlog::VERSION
  s.authors     = ["David Billskog"]
  s.email       = ["billskog@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Locate memory leaks in your Rails application}
  s.description = %q{Memlog is a simple gem to track down memory leaks in your Rails application}

  s.rubyforge_project = "memlog"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
