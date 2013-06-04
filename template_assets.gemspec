$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "template_assets/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "template_assets"
  s.version     = TemplateAssets::VERSION
  s.authors     = ["Hui Peng Hu"]
  s.email       = ["woohp135@gmail.com"]
  s.homepage    = "http://www.google.com"
  s.summary     = "Help deal with template assets."
  s.description = "Help deal with template assets."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency "sqlite3"
end
