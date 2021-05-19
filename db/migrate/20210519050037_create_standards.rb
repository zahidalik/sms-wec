class CreateStandards < ActiveRecord::Migration[6.0]
  def change
    create_table :standards do |t|
      t.string :name
      t.string :section
      t.string :class_teacher
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
