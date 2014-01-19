class ActiveRecord::Migration
  def domain_aware(table_name)
    change_table table_name do |t|
      t.belongs_to :domain
    end
  end
end
