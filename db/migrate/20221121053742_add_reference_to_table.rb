class AddReferenceToTable < ActiveRecord::Migration[5.0]
  def change
    add_reference :cart_items, :dish, index: true
    add_reference :favourite_dishes, :dish, index: true
    add_reference :reviews, :dish, index: true
  end
end
