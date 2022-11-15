class Order < ApplicationRecord
  belongs_to :user
  has_many :user_products, dependent: :destroy
  has_many :products, through: :user_products

  enum order_status: { ready: 0, under_process: 1 }

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
