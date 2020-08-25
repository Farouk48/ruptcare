class AddCoordinatesToPharmas < ActiveRecord::Migration[6.0]
  def change
    add_column :pharmas, :latitude, :float
    add_column :pharmas, :longitude, :float
  end
end
