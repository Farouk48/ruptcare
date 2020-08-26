class RenameDrugsAvailibityColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :drugs, :availibity, :availability
  end
end
