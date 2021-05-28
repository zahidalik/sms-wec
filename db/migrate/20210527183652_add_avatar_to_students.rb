class AddAvatarToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :avatar, :string
  end
end
