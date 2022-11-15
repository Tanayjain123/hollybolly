class CreateDinningTables < ActiveRecord::Migration[5.0]
  def change
    create_table :dinning_tables do |t|
      t.integer :sitting_capacity
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
