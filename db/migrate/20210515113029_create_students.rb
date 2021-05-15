class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :username
      t.string :email
      t.string :contact
      t.string :address
      t.string :father
      t.string :mother
      t.string :password_digest

      t.timestamps
    end
    add_index :students, :username, unique: true
  end
end
