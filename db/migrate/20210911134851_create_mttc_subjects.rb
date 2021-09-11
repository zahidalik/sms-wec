class CreateMttcSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :mttc_subjects do |t|
      t.string :name
      t.integer :credits
      t.float :hours

      t.timestamps
    end
  end
end
