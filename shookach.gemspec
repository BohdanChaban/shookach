lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/shookach/version'

Gem::Specification.new do |s|
  s.name        = 'shookach'
  s.version     = Shookach::VERSION
  s.authors     = ['Bohdan Chaban']
  s.email       = 'b.chaban.91@gmail.com'

  s.summary     = 'Full-text search'
  s.description = 'A simple gem for full-text search'
  s.homepage    = 'https://github.com/BohdanChaban/shookach'
  s.license     = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.16"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
