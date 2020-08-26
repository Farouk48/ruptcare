class Patient < ApplicationRecord

  has_many :patient_drugs
  belongs_to :doctor
  belongs_to :pharma

  has_many :users, through: :pharmas

include PgSearch::Model

pg_search_scope :search_by_first_name_and_last_name
  
  against: [:first_name, :last_name],
  using: {
  	tsearch: {prefix: true}
  }



end
