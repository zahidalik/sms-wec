class CreateStudentSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :student_subjects do |t|
      t.string :name
      t.references :student_standard_academic_year, null: false, foreign_key: true
      t.references :user_standard_academic_year, null: false, foreign_key: true

      t.timestamps
    end
  end
end
