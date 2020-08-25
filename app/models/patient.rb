class Patient < ApplicationRecord
  has_many :patient_drugs
  belongs_to :doctor
  belongs_to :pharma
  belongs_to :user, through: :pharma
end
