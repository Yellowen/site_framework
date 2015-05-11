class CreateSiteFrameworkDomains < ActiveRecord::Migration
  def change
    create_table :site_framework_domains do |t|
      t.string :name
      t.integer :site_id
      t.integer :parent_id, default: nil
      t.boolean :alias, default: false

      t.timestamps
    end

    add_index :site_framework_domains, :name, unique: true
  end
end
