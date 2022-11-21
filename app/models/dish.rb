class Dish < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :cart_items
  has_one :favourite_dish


  enum status: { available: 0, unavailable: 1 }

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true


end
