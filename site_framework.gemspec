$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'site_framework/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'site_framework'
  s.version     = SiteFramework::VERSION
  s.authors     = ['Sameer Rahmani']
  s.email       = ['lxsameer@gnu.org']
  s.homepage    = 'https://github.com/Yellowen/site_framework'
  s.summary     = 'A site framework for Ruby on Rails web framework inspired by Django site fremework'
  s.description = 'A site framework for Ruby on Rails web framework inspired by Django site fremework. The idea of this gem to transparently make Rails facilities to work with different domains.'
  s.licenses = ['GPL-2']

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'railties', '>3'
  s.add_dependency 'orm_adapter'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'  
end
