class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :rpps_number, :integer
    add_reference :users, :pharma, null: false, foreign_key: true
  end
end
