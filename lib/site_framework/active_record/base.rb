module SiteFramework
  module DomainAware
    extend ActiveSupport::Concern

    included do
      belongs_to :domain
      default_scope -> { where(:domain => Rails.application.domain) }
    end
  end
end
