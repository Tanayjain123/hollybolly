class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favourite_dishes, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :orders,dependent: :destroy
  has_many :dinning_tables, through: :bookings, dependent: :destroy
  # has_many :products, through: :cart
  # has_many :products, through: :orders
  #enum role: {user: 0, admin: 1 }
  enum gender: { male: 0, female: 1, Others: 2 }
  #validates :password_digest, presence: true,
                       #length: { minimum: 6 }
  #validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  #validates :name, presence: true
  #validates :address, presence: true

  devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :registerable,
  #        :recoverable, :rememberable, :validatable

  def say_hello
    "Hello World!"
 end

end

