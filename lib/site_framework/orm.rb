module SiteFramework
  module ORM
    def current_orm
      if defined? ActiveRecord
        'active_record'
      elsif defined? Mongoid
        'mongoid'
      end
    end
  end
end
