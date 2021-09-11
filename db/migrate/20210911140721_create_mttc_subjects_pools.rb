class CreateMttcSubjectsPools < ActiveRecord::Migration[6.0]
  def change
    create_table :mttc_subjects_pools do |t|
      t.string :term
      t.string :academic_year
      t.date :beginning_date
      t.date :ending_date
      t.time :lesson_time
      t.string :lesson_days
      t.string :class_room
      t.references :mttc_subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
