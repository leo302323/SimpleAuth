$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_auth"
  s.version     = SimpleAuth::VERSION
  s.authors     = ["zhaolongwen"]
  s.email       = ["zlw302323@gmail.com"]
  s.homepage    = "https://github.com/leo302323/SimpleAuth"
  s.summary     = "simple jwt authentication plugin for rails api"
  s.description = "tapas style restful api for authentication"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"
  s.add_dependency 'jwt', '~> 2.0.0'
  s.add_dependency 'simple_command', '0.0.9'
  s.add_dependency 'redis'
  s.add_dependency 'redis-namespace'
end
