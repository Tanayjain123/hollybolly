class Cart < ApplicationRecord
  belongs_to :user
  has_many :user_products, dependent: :destroy
  has_many :products, through: :user_products

end
