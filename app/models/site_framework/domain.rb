module SiteFramework
  class Domain < ActiveRecord::Base
    belongs_to :site

    validates_associated :site
    validates :name, :presence => true,
    :format => { :with => /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix }
  end
end
