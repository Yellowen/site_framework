class ActiveRecord::Migration
  def domain_aware(table_name)
    fail "'domain_aware' deprecated use 'site_aware' instead."
  end

  def site_aware(table_name)
    change_table table_name do |t|
      if SiteFramework::Engine.use_uuid
        t.uuid :site_id
      else
        t.integer :site_id
      end
    end

    add_index table_name, :site_id
  end
end
