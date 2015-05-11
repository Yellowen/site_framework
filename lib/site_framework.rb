# Main module of `site_framework` gem
module SiteFramework
  autoload :Middleware, 'site_framework/middleware'

  module Routing
  end
end

require 'site_framework/engine'
require 'site_framework/railtie'
require 'site_framework/orm'
require 'site_framework/routing/site_constraint'
require 'site_framework/routing/sites'
require 'site_framework/action_dispatch'

case SiteFramework::ORM.current_orm
when 'active_record'
  require 'site_framework/active_record/migration'
  require 'site_framework/active_record/concerns'
when 'mongoid'
  require 'site_framework/mongoid/concerns'
end
