class RemoveReferences < ActiveRecord::Migration[5.0]
  def change
    remove_column :cart_items, :product_id, index: true, foreign_key: true
    remove_column :favourite_dishes, :product_id, index: true, foreign_key: true
    remove_column :reviews, :product_id, index: true, foreign_key: true
  end
end
