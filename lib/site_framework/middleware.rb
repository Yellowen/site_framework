module SiteFramework
  # Rack middleware class of `site_framework` which is responsible for loading
  # [Domain] model instance and [Site] model instance and putting them on
  # `Rails.application`.
  class Middleware

    # Middleware initializer method which gets the `app` from previous
    # middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      # Create a method called domain which will return the current domain
      # name
      Rails.application.send :define_singleton_method, 'domain_name' do
        env['SERVER_NAME']
      end

      # Create `fetch_domain` method on `Rails.application`
      # only if it didn't already define.
      unless Rails.application.respond_to? :fetch_domain
        Rails.application.send :define_singleton_method, 'fetch_domain' do
          if defined? ActiveRecord
            Domain.find_by(nam: Rails.application.domain_name)
          elsif defined? Mongoid
            Site.where('domains.name' => Rails.application.domain_name).domains.first
          end
        end
      end

      Rails.application.send :define_singleton_method, 'domain' do
        domain = nil
        if Rails.application.instance_variable_defined? '@domain'
          domain = Rails.application.instance_variable_get '@domain'
          if respond_to? :logger
            logger.info "`domain` is defined, value #{domain}"
          end
        end

        if domain.nil?
          # Fetch domain by calling **fetch_domain** method on
          # **Rails.application**
          domain_obj = fetch_domain
          if respond_to? :logger
            logger.debug '`domain` is nil'
            logger.warn "Can't find domain object of `#{Rails.application.domain_name}`"
          end
          Rails.application.instance_variable_set '@domain', domain_obj
          domain = domain_obj
        end

        domain
      end

      Rails.application.send :define_singleton_method, 'site' do
        site = nil
        unless Rails.application.domain.nil?
          site = Rails.application.domain.site
        end
        site
      end

      Rails.application
      @app.call(env)
    end
  end
end
