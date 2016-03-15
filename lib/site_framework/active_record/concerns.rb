module SiteFramework
  module DomainAware
    extend ActiveSupport::Concern

    included do
      belongs_to :domain, class_name: '::SiteFramework::Domain'
      default_scope -> {
        where(domain_id: SiteFramework::CurrentState.instance.domain)
      }
    end
  end
end
