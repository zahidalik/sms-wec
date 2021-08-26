class AddChargeToDesignations < ActiveRecord::Migration[6.0]
  def change
    add_column :designations, :charge, :string
  end
end
