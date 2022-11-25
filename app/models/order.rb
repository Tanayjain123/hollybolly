class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :dishes, through: :cart_items

  enum order_status: { ready: 0, under_process: 1 }

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def total
    sum = 0
    self.cart_items.each do |cart_item|
        sum += cart_item.quantity * cart_item.dish.price
    end
    sum
  end

end
