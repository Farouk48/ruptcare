class Drug < ApplicationRecord
  has_many :stocks
  has_many :patient_drugs
  has_one_attached :photo

  include PgSearch::Model

  pg_search_scope :search_by_name_and_action,
	  against: [:name],
	  using: {
	  	tsearch: {prefix: true}
	  }

end
