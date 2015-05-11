class SiteFramework::Routing::SiteConstraint

  attr_reader :logger

  def initialize
    @logger = Rails.logger
  end

  def domains
    SiteFramework::Domain.select('DISTINCT name').map(&:name).uniq
  end

  def matches?(request)
    if domains.include? request.host
      define_domain_name         request.host
      define_fetch_domain_method request.host
      define_domain
      define_site
      true
    else

      logger.info("Domain name '#{request.host}' does not match with any exist domains")
      false
    end

  end

  private

  def define_domain_name(domain)
    Rails.application.send :define_singleton_method, 'domain_name' do
      domain
    end
  end

  def define_domain
    # TODO: Find a better way to do this.
    Rails.application.send :define_singleton_method, 'domain' do
      domain_ = nil
      if Rails.application.instance_variable_defined? '@domain'
        domain_ = Rails.application.instance_variable_get '@domain'
        if respond_to? :logger
          logger.info "`domain` is defined, value #{domain}"
        end
      end

      if domain_.nil?
        # Fetch domain by calling **fetch_domain** method on
        # **Rails.application**
        domain_obj = fetch_domain
        if respond_to? :logger
          logger.debug '`domain` is nil'
          logger.warn "Can't find domain object of `#{Rails.application.domain_name}`"
        end
        Rails.application.instance_variable_set '@domain', domain_obj
        domain_ = domain_obj
      end

      domain_
    end

  end

  def define_site
    Rails.application.send :define_singleton_method, 'site' do
      site = nil
      site = Rails.application.domain.site unless Rails.application.domain.nil?
      site
    end
  end

  def define_fetch_domain_method(domain)
    Rails.application.send :define_singleton_method, 'fetch_domain' do
      if defined? ActiveRecord
        Domain.find_by(nam: domain)
      elsif defined? Mongoid
        Site.where('domains.name' => domain).domains.first
      end
    end
  end
end
