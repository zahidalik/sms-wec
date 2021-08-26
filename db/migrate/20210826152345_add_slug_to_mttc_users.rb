class AddSlugToMttcUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :mttc_users, :slug, :string
    add_index :mttc_users, :slug, unique: true
  end
end
