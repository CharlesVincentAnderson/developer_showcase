class Portfolio < ApplicationRecord
  belongs_to :user, inverse_of: :portfolio
  has_one :about_me
end
