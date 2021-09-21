class AddSlugToMttcSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :mttc_subjects, :slug, :string
    add_index :mttc_subjects, :slug, unique: true
  end
end
