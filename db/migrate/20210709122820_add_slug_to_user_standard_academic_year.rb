class AddSlugToUserStandardAcademicYear < ActiveRecord::Migration[6.0]
  def change
    add_column :user_standard_academic_years, :slug, :string
    add_index :user_standard_academic_years, :slug, unique: true
  end
end
