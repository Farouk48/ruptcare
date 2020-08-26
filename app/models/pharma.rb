class Pharma < ApplicationRecord
  has_many :users
  has_many :stocks
  has_many :patients
  has_many :drugs, through: :stocks

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
