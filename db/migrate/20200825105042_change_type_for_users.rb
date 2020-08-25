class ChangeTypeForUsers < ActiveRecord::Migration[6.0]
  def change
        change_column :users, :rpps_number, :string
  end
end
