class SiteFramework::Routing::SiteConstraint

  attr_reader :logger

  def initialize(mapper)
    @logger = Rails.logger
    @mapper = mapper
  end

  def domain(name)
    return @domain if @domain_name == name

    if defined? ActiveRecord
      @domain = SiteFramework::Domain.find_by(name: name)
    elsif defined? Mongoid
      @domain = SiteFramework::Site.where('domains.name' => name).domains.first
    else
      nil
    end
  end

  def matches?(request)
    if domain_obj = domain(request.host)
      @domain_name = request.host
      logger.debug("'#{@domain_name}' matched.")
      setup(domain_obj, request)
      initialize_site_default_state

      true
    else
      logger.info("Domain name '#{request.host}' does not match with any exist domains")
      set_request_data_to_nil(request)
      @domain_name = request.host
      false
    end
  end

  private

  def setup(domain_, request)
    SiteFramework::CurrentState.instance.domain_name = domain_.name
    SiteFramework::CurrentState.instance.domain      = domain_
    SiteFramework::CurrentState.instance.site        = domain_.site
    @site                                            = domain_.site

    request.instance_eval do
      def site
        SiteFramework::CurrentState.instance.site
      end

      def domain
        SiteFramework::CurrentState.instance.domain
      end

      def domain_name
        SiteFramework::CurrentState.instance.domain_name
      end
    end
  end

  def set_request_data_to_nil(request)
    request.instance_eval do
      def site
      end

      def domain
      end

      def domain_name
      end
    end
  end

  def initialize_site_default_state
    @site.try(:before_dispatch, @mapper)
  end
end
