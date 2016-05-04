class ActiveRecord::Migration
  def domain_aware(table_name)
    fail "'domain_aware' deprecated use 'site_aware' instead."
  end

  def site_aware(table_name)
    change_table table_name do |t|
      t.integer :site_id
    end

    add_index table_name, :site_id
  end
end
