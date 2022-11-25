class FavouriteDish < ApplicationRecord
  belongs_to :user
  belongs_to :dish
  # validates :dish_id ,uniqueness: {scope: :user_id ,
  # message: "you have already reviewed this dish"}
end
