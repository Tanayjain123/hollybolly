class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :dishes, through: :cart_items

  def sub_total
    sum = 0
    self.cart_items.each do |cart_item|
      sum += cart_item.total_amount
    end
    sum
  end

end
