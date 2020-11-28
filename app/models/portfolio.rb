class Portfolio < ApplicationRecord
  belongs_to :user, inverse_of: :portfolio
end
