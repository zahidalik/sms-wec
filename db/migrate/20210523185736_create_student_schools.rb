class CreateStudentSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :student_schools do |t|
      t.references :student, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
