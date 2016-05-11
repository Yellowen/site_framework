class CreateSiteFrameworkDomains < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if SiteFramework::Engine.use_uuid

    create_table :site_framework_domains, **args do |t|
      t.string :name
      if SiteFramework::Engine.use_uuid
        t.uuid :site_id
        t.uuid :parent_id, default: nil
      else
        t.integer :site_id
        t.integer :parent_id, default: nil
      end
      t.boolean :alias, default: false

      t.timestamps
    end

    add_index :site_framework_domains, :name, unique: true
  end
end
