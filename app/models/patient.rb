class Patient < ApplicationRecord

  has_many :patient_drugs
  belongs_to :doctor
  belongs_to :pharma

  has_many :users, through: :pharmas

end
