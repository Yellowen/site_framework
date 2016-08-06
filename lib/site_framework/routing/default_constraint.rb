class SiteFramework::Routing::DefaultConstraint

  attr_reader :logger

  def initialize(mapper, defaults = nil)
    @logger          = Rails.logger
    @mapper          = mapper
    @default_domains = defaults || SiteFramework::Engine.default_domains
  end


  def matches?(request)
    return true  if @matched
    return false if @matched == false

    @domain_name = request.host

    if @mathced = @default_domains.include?(@domain_name)
      logger.debug('Loading default site configuration')
      patch_request(request)
      true
    else
      logger.warn("Domain name '#{request.host}' does not match with any exist domains")
      patch_request(request)
      false
    end
  end

  private

  def patch_request(request)
    SiteFramework::CurrentState.instance.domain_name = nil
    SiteFramework::CurrentState.instance.domain      = nil
    SiteFramework::CurrentState.instance.site        = nil

    request.instance_eval do
      def site
      end

      def domain
      end

      def domain_name
      end

    end
  end
end
