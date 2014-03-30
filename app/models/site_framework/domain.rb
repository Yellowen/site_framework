module SiteFramework
  # This model represent a **Domain**. Each domain
  # belongs to a [Site] model and may or may not
  # belongs to another  **Domain**
  class Domain < ActiveRecord::Base

    belongs_to :site

    # Self relation
    belongs_to :parent, :class_name => self.class

    validates_associated :site
    validates :name, :presence => true,
    :format => { :with => /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)\z/ix }
  end
end
