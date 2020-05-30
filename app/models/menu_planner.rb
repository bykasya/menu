class MenuPlanner < ApplicationRecord
  belongs_to :dish
  has_many :ingredients, through: :dishes
end
