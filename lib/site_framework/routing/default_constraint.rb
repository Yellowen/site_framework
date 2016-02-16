class SiteFramework::Routing::DefaultConstraint

  attr_reader :logger

  def initialize(mapper, defaults = nil)
    @logger          = Rails.logger
    @mapper          = mapper
    @default_domains = defaults || SiteFramework::Engine.default_domains
  end


  def matches?(request)
    @domain_name = request.host

    if @default_domains.include? @domain_name
      logger.debug("Loading default site configuration")

      SiteFramework::CurrentState.instance.domain_name = nil
      SiteFramework::CurrentState.instance.domain      = nil
      SiteFramework::CurrentState.instance.site        = nil

      request.instance_eval do
        def site
        end

        def domain
        end

        def domamin_name
        end

      end

      true
    else
      logger.info("Domain name '#{request.host}' does not match with any exist domains")
      false
    end
  end

end
