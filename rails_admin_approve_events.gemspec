$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_approve_events/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_approve_events"
  s.version     = RailsAdminApproveEvents::VERSION
  s.authors     = ["Sungil Lim"]
  s.email       = ["chamon1231@hotmail.com"]
  s.homepage    = "http://github.com/sungil"
  s.summary     = "Approve events"
  s.description = "Approve events for Steam project."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.12"
end
