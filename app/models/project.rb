class Project < ApplicationRecord
  belongs_to :portfolio
  has_many :features
end
