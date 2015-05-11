module SiteFramework::Routing
  module Sites
    def sites(&block)
      constraints(SiteFramework::Routing::SiteConstraint.new) do
        block.call
      end
    end
  end
end
