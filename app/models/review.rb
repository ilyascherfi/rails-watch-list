class Review < ApplicationRecord
  belongs_to :list

  validates :comment, :rating, presence: true
  validates :rating, 
end
