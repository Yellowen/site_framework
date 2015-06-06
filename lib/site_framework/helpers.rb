require 'site_framework/current_state'

module SiteFramework

  # Return the current site, domain, domain_name
  # if it wasn't the default site
  module DummyHelper

    def current_site
      SiteFramework::CurrentState.instance.site
    end

    def current_domain
      SiteFramework::CurrentState.instance.domain
    end

    def current_domain_name
      SiteFramework::CurrentState.instance.domain_name
    end

    def default_site?
      return true if SiteFramework::CurrentState.instance.site.nil?
      false
    end
  end

  module Helpers
    extend ActiveSupport::Concern
    include SiteFramework::DummyHelper

    module ClassMethods
      include SiteFramework::DummyHelper
    end
  end
end
