class RenameDrugsClassColumn < ActiveRecord::Migration[6.0]
  def change
     rename_column :drugs, :class, :drugs_class
  end
end
