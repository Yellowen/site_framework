require 'site_framework/helpers'

# Main module of `site_framework` gem
module SiteFramework
  autoload :Middleware, 'site_framework/middleware'
  include  SiteFramework::Helpers

  module Routing
  end
end

require 'site_framework/current_state'
require 'site_framework/engine'
require 'site_framework/railtie'
require 'site_framework/orm'
require 'site_framework/routing'
require 'site_framework/action_dispatch'
require 'site_framework/action_controller/base'


case SiteFramework::ORM.current_orm
when 'active_record'
  require 'site_framework/active_record/migration'
  require 'site_framework/active_record/concerns'
when 'mongoid'
  require 'site_framework/mongoid/concerns'
end
