module SiteFramework
  module DomainAware
    extend ActiveSupport::Concern

    included do
      puts "Warning: This concern is deprecated and will be removed in next version"
      puts "Use 'SiteFramework::SiteAware' instead."
      belongs_to :domain, class_name: '::SiteFramework::Domain'
      default_scope -> {
        where(site: SiteFramework::CurrentState.instance.site)
      }
    end
  end

  module SiteAware
    extend ActiveSupport::Concern

    included do
      belongs_to :site, class_name: '::SiteFramework::Site'
      default_scope -> {
        where(site: SiteFramework::CurrentState.instance.site)
      }
    end
  end
end
