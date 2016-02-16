class AddDefaultTemplateToSites < ActiveRecord::Migration[5.0]
  def up
    add_column :sites, :default_template, :string
  end

  def down
    remove_column :sites, :default_template,
  end
end
