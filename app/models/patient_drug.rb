class PatientDrug < ApplicationRecord
  belongs_to :drug
  belongs_to :patient, dependent: :destroy
end
