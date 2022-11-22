class Category < ApplicationRecord
  has_many :dishes
  def to_s
    "#{category_name}"
  end
end
