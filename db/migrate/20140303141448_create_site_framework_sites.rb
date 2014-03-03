class CreateSiteFrameworkSites < ActiveRecord::Migration
  def change
    create_table :site_framework_sites do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
