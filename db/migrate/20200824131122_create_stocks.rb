class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.integer :quantity
      t.references :pharma, foreign_key: true
      t.references :drug, foreign_key: true

      t.timestamps
    end
  end
end
