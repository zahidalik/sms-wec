class AddSlugToStandards < ActiveRecord::Migration[6.0]
  def change
    add_column :standards, :slug, :string
    add_index :standards, :slug, unique: true
  end
end
