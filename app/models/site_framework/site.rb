module SiteFramework
  class Site < ActiveRecord::Base
    has_many :domains

    def slug
      if title
        title
      else
        # TODO: generate a sha1 hash base on time
      end

    end
  end
end
