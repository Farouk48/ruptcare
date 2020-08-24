class Drug < ApplicationRecord
  has_many :stocks
  has_many :patient_drugs
end
