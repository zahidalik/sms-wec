class CreateUserSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :user_subjects do |t|
      t.string :name
      t.references :user_standard_academic_year, null: false, foreign_key: true

      t.timestamps
    end
  end
end
