class CreateSiteFrameworkSites < ActiveRecord::Migration
  def change
    args = {}
    args[:id] = :uuid if SiteFramework::Engine.use_uuid

    create_table :site_framework_sites, **args do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
