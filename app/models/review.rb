class Review < ApplicationRecord
  belongs_to :dish
  belongs_to :user
  validates :rating, presence:  { message: 'rating should be between 1 to 5' },numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

end
