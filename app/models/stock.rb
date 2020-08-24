class Stock < ApplicationRecord
  belongs_to :drug
  belongs_to :pharma
end
