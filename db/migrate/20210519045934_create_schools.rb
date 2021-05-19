class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :head
      t.string :deputy_head
      t.string :academic_head
      t.string :assistant_a_h
      t.string :islamic_deputy
      t.string :environment_incharge

      t.timestamps
    end
  end
end
