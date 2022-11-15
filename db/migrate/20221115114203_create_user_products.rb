class CreateUserProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_products do |t|
      t.integer :quantity, default: 1
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
