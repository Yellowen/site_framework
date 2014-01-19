module SiteFramework
  class Engine < ::Rails::Engine

    isolate_namespace SiteFramework
    engine_name "site_framework"

    config.generators do |g|
      g.test_framework :rspec
    end

  end
end
