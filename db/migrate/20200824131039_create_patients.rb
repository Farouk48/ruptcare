class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :age
      t.string :city
      t.string :chronic_disease
      t.references :doctor, foreign_key: true
      t.references :pharma, foreign_key: true

      t.timestamps
    end
  end
end
