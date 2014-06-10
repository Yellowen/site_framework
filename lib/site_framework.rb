# Main module of `site_framework` gem
module SiteFramework
end

require "site_framework/engine"
require 'site_framework/railtie'
require 'site_framework/orm'

case SiteFramework::ORM.current_orm
when 'active_record'
  require 'site_framework/active_record/migration'
  require 'site_framework/active_record/concerns'
when 'mongoid'
  require 'site_framework/mongoid/concerns'
end

require 'site_framework/middleware'
