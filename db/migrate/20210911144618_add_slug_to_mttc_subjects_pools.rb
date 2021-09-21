class AddSlugToMttcSubjectsPools < ActiveRecord::Migration[6.0]
  def change
    add_column :mttc_subjects_pools, :slug, :string
    add_index :mttc_subjects_pools, :slug, unique: true
  end
end
