module SiteFramework
  # This model represent a **Domain**. Each domain
  # belongs to a [Site] model and may or may not
  # belongs to another  **Domain**
  class Domain < (defined?(ActiveRecord) ? ActiveRecord::Base : Object)

    if defined? Mongoid
      include Mongoid::Document
      include Mongoid::Timestamps

      field :name, :type => String
      field :parent, :type => String
      field :alias, :type => Boolean

      embedded_in :site

      index({ name: 1 }, { unique: true, background: true })

      def parent
        # TODO: return a domain with alias == false
      end
    end

    if defined? ActiveRecord
      belongs_to :site

      # Self relation
      belongs_to :parent, :class_name => self.class
      validates_associated :site
    end

    validates :name, :presence => true,
       :format => { :with => /\A(?:[a-z0-9\-]+\.)+[a-z]{2,4}\z/i }
    validates_uniqueness_of :name
  end
end
