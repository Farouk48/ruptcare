class CreateDrugs < ActiveRecord::Migration[6.0]
  def change
    create_table :drugs do |t|
      t.string :name
      t.string :class
      t.string :family
      t.string :action
      t.string :galenic
      t.string :posology
      t.string :recommandations
      t.integer :availibity

      t.timestamps
    end
  end
end
