class SiteFramework::Routing::SiteConstraint
  def matches?(request)
    ['ex.example.com', 'test.com', 'example.com'].include? request.host
  end
end
