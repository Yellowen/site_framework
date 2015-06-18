module SiteFramework
  # **SiteFramework** rails engine class.
  class Engine < ::Rails::Engine

    isolate_namespace SiteFramework
    engine_name 'site_framework'

    config.generators do |g|
      g.test_framework :rspec
    end

    @@default_domains = ['localhost']

    mattr_accessor :default_domains

    def self.setup
      yield self
    end
  end
end
