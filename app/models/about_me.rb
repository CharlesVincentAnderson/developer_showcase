class AboutMe < ApplicationRecord
  belongs_to :portfolio
  has_one_attached :head_shot
end
