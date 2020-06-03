class DishesIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
  validates_presence_of :ingredient, uniqueness: { scope: :dish }
  validates :dish, presence: true
end
