class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :order_status, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
