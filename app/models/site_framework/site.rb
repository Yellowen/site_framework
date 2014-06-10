module SiteFramework
  # This model represent the **Site** entity.
  # [SiteFramework::Middleware] will check for a site
  # with current domain of request and attach the object
  # to global **Rails** object
  class Site < (defined? ActiveRecord ? ActiveRecord::Base : Object)

    if defined? Mongoid
      include Mongoid::Document
      include Mongoid::Timestamps

      field :title, :type => String
      field :description, :type => String

      embeds_many :domains
    end

    has_many :domains if defined? ActiveRecord::Base

    # This method returns a slug for site title
    def slug
      if title
        title
      else
        # TODO: generate a sha1 hash base on time
      end
    end
  end
end
