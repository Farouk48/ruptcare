class PatientDrug < ApplicationRecord
  belongs_to :drug
  belongs_to :patient
end
