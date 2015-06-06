module SiteFramework::Routing
  module Sites
    def sites
      constraints(SiteFramework::Routing::SiteConstraint.new) do
        yield
      end
    end

    def default_site
      constraints(SiteFramework::Routing::DefaultConstraint.new) do
        yield
      end
    end
  end
end
