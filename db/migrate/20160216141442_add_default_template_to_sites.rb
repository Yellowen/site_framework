class AddDefaultTemplateToSites < ActiveRecord::Migration[5.0]
  def up
    add_column :site_framework_sites, :default_template, :string, default: ''
  end

  def down
    remove_column :site_framework_sites, :default_template
  end
end
