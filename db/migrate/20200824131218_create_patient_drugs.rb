class CreatePatientDrugs < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_drugs do |t|
      t.string :disease
      t.references :drug, foreign_key: true
       t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
