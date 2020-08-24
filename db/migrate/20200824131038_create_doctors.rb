class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :full_name
      t.integer :rpps_number
      t.string :speciality

      t.timestamps
    end
  end
end
