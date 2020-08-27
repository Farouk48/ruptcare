class Doctor < ApplicationRecord
  has_many :patients
  has_many :messages, as: :sender
end
