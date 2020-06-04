class DishesIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
  validates :ingredient, uniqueness: { scope: :dish }
  validates :dish, presence: true
end
