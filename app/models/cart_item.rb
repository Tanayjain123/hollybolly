class CartItem < ApplicationRecord
  belongs_to :dish, optional: true
  belongs_to :order, optional: true
  belongs_to :cart, optional: true

  def total_amount
    self.quantity * self.dish.price
  end

end
