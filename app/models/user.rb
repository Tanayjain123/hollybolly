class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favourite_dishes
  has_many :bookings
  has_one :cart
  has_many :orders
  has_many :dinning_tables, through: :bookings
  has_many :products, through: :cart
  has_many :products, through: :orders

  
  enum role: {user: 0, admin: 1 }
  enum gender: { male: 0, female: 1, Others: 2 }

  #validates :password_digest, presence: true,
                       #length: { minimum: 6 }

  #validates :email, presence: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  #validates :name, presence: true
  #validates :address, presence: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :registerable,
  #        :recoverable, :rememberable, :validatable

  devise :database_authenticatable, :registerable, 
     :recoverable, :rememberable, :validatable







end

