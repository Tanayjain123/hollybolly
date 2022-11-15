class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_one :favourite_dishes


  enum status: { available: 0, unavailable: 1 }

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true


end
