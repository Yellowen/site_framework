class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.url :name
      t.url :alias

      t.timestamps
    end
  end
end
