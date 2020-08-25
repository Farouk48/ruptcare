class Pharma < ApplicationRecord
  has_many :users
  has_many :stocks
  has_many :patients

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
