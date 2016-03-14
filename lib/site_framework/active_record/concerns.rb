module SiteFramework
  module DomainAware
    extend ActiveSupport::Concern

    included do
      belongs_to :domain, class_name: '::SiteFramework::Domain'
      domain = SiteFramework::CurrentState.instance.domain.id
      default_scope -> { where(domain_id: domain) }
    end
  end
end
