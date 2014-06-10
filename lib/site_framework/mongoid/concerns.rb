module SiteFramework
  module DomainAware
    extend ActiveSupport::Concern

    included do
      belongs_to :site
      default_scope -> { where(:site.domain => Rails.application.domain) }
    end

  end
end
