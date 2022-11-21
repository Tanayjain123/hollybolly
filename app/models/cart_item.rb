class CartItem < ApplicationRecord
  belongs_to :dish, optional: true
  belongs_to :order, optional: true
  belongs_to :cart, optional: true
end
