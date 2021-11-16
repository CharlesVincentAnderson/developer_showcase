class Feature < ApplicationRecord
  belongs_to :project
  has_one_attached :picture
end
