class CreateUserSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :user_schools do |t|
      t.references :user, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
