class ActiveRecord::Migration
  def domain_aware(table_name)
    change_table table_name do |t|
      t.integer :domain_id
    end
  end
end
