module SiteFramework
  # **SiteFramework** rails engine class.
  class Engine < ::Rails::Engine

    isolate_namespace SiteFramework
    engine_name 'site_framework'

    config.generators do |g|
      g.test_framework :rspec
    end


    mattr_accessor :default_domains do
      ['localhost']
    end

    # This option allows developers to specify the prefix of path
    # which they wanted to prepend to view_paths array
    mattr_accessor :view_path_prefix do
      'app/views'
    end

    mattr_accessor :use_uuid do
      false
    end

    def self.setup
      yield self
    end
  end
end
