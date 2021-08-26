class CreateDesignations < ActiveRecord::Migration[6.0]
  def change
    create_table :designations do |t|
      t.references :designable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
