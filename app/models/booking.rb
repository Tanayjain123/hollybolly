class Booking < ApplicationRecord
  belongs_to :user
  has_many :dinning_tables

  validates :occassion, presence: true
  validates :no_of_people, presence: true
  validates :date, presence: true

end
