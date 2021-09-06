class CreateMttcStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :mttc_students do |t|
      t.string :username
      t.string :full_name
      t.date :d_o_b
      t.string :father
      t.string :mother
      t.string :religion
      t.string :status_of_father_and_mother
      t.string :contact_of_father
      t.string :contact_of_mother
      t.string :address
      t.date :admission_date
      t.string :password_digest

      t.timestamps
    end
  end
end
