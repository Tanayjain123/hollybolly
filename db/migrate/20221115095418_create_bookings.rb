class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :date
      t.integer :no_of_people
      t.string :occassion
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
