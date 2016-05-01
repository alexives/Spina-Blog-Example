$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spina_blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spina_blog"
  s.version     = SpinaBlog::VERSION
  s.authors     = ["Bram Jetten"]
  s.email       = ["mail@bramjetten.nl"]
  s.homepage    = "https://www.denkgroot.com"
  s.summary     = "Blog plugin."
  s.description = "Aanmaken van blogposts."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
