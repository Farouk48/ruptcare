class Drug < ApplicationRecord
  has_many :stocks
  has_many :patient_drugs

  include PgSearch::Model

  pg_search_scope :search_by_name_and_action,
	  against: [:name, :action],
	  using: {
	  	tsearch: {prefix: true}
	  }

end
