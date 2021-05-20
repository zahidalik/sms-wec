class CreateStudentStandardAcademicYears < ActiveRecord::Migration[6.0]
  def change
    create_table :student_standard_academic_years do |t|
      t.string :year
      t.references :student, null: false, foreign_key: true
      t.references :standard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
