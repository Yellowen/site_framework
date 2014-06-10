module SiteFramework
  module ORM
    def self.current_orm
      if defined? ActiveRecord
        'active_record'
      elsif defined? Mongoid
        'mongoid'
      end
    end

    def self.base_class
      case current_orm
      when 'active_record'
        ::ActiveRecord::Base
      when 'mongoid'
        Object
      end
    end
  end
end
