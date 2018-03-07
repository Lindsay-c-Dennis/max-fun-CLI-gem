
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "maximumfun/version"

Gem::Specification.new do |spec|
  spec.name          = "maximumfun"
  spec.version       = Maximumfun::VERSION
  spec.authors       = ["Lindsay Dennis"]
  spec.email         = ["lindsay.c.dennis@gmail.com"]

  spec.summary       = "Maximum Fun Comedy Podcast Inventory"
  spec.description   = "Lists Max Fun comedy podcasts, allows user to view more info on individual podcasts"
  spec.homepage      = "https://github.com/Lindsay-c-Dennis/max-fun-CLI-gem"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
