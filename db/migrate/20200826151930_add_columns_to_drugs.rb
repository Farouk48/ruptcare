class AddColumnsToDrugs < ActiveRecord::Migration[6.0]
  def change
    add_column :drugs, :administration, :string
    add_column :drugs, :commercialisation, :string
  end
end
