module SiteFramework::Routing
  module Sites
    def sites(mapper)
      constraints(SiteFramework::Routing::SiteConstraint.new(mapper)) do
        yield
      end
    end

    def default_site(mapper, defaults)
      constraint = SiteFramework::Routing::DefaultConstraint.new(mapper,
                                                                 defaults)
      constraints(constraint) do
        yield
      end
    end
  end
end
