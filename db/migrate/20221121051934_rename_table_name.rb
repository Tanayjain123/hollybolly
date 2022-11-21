class RenameTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :products, :dishes
    rename_table :user_products, :cart_items
  end
end
