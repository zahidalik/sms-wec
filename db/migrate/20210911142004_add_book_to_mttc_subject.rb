class AddBookToMttcSubject < ActiveRecord::Migration[6.0]
  def change
    add_column :mttc_subjects, :book, :string
  end
end
