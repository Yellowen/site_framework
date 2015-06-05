module SiteFramework
  module Helpers
    extends ActiveSupport::Concern

    def current_site
      @@site
    end

    def current_domain
      @@domain
    end

    def current_domain_name
      @@domain_name
    end

    def default_site?
      return true if @@site.nil?
      false
    end

    class ClassMethods
      def current_site=(site)
        @@site = site
      end

      def current_domain=(domain)
        @@domain = domain
      end

      def current_domain_name=(name)
        @@domain_name = name
      end
    end
  end
end
