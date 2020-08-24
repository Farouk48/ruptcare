class Pharma < ApplicationRecord
  has_many :users
  has_many :stocks
  has_many :patients
end
