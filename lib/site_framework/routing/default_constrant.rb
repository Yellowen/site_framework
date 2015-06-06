class SiteFramework::Routing::DefaultConstraint

  attr_reader :logger

  def initialize
    @logger = Rails.logger
  end


  def matches?(request)
    @domain_name = request.host

    if SiteFramework::Engine.default_domains.include? @domain_name
      logger.debug("Loading default site configuration")

      SiteFramework::CurrentState.instance.domain_name = nil
      SiteFramework::CurrentState.instance.domain      = nil
      SiteFramework::CurrentState.instance.site        = nil

      true
    else
      logger.info("Domain name '#{request.host}' does not match with any exist domains")
      false
    end
  end

end
