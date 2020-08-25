class ChangeTypeForDoctors < ActiveRecord::Migration[6.0]
  def change
    change_column :doctors, :rpps_number, :string
  end
end
