module SiteFramework
  # This model represent a **Domain**. Each domain
  # belongs to a [Site] model and may or may not
  # belongs to another  **Domain**
  class Domain < (defined?(ActiveRecord) ? ActiveRecord::Base : Object)

    PATTERN = /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix

    if defined? Mongoid
      include Mongoid::Document
      include Mongoid::Timestamps

      field :name,   type: String
      field :parent, type: String,  default: nil
      field :alias,  type: Boolean, default: false

      embedded_in :site

      index({ name: 1 }, { unique: true, background: true })

      def parent
        # TODO: return a domain with alias == false
      end
    end

    if defined? ActiveRecord
      belongs_to :site

      # Self relation
      belongs_to :parent, class_name: self.to_s
      validates_associated :site
    end

    validates(:name, presence: true, format: { with: PATTERN })
    validates_uniqueness_of :name

    before_save :normalize_name

    def normalize_name
      self.name = name.downcase
    end
  end
end
