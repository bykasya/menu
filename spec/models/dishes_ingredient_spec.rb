require 'rails_helper'

RSpec.describe DishesIngredient, type: :model do

  it "is valid with valid attributes" do
  dish=Dish.create(dname: "Salad")
  ingredient=Ingredient.create(iname: "Salad")
  subject= DishesIngredient.new(dish_id: dish.id, ingredient_id: ingredient.id)
  expect(subject).to be_valid
  end

  it "is not valid without a dish_id" do
  ingredient=Ingredient.create(iname: "Tomato")
  subject=DishesIngredient.new(dish_id: nil, ingredient_id: ingredient.id)
  expect(subject).to_not be_valid
  end

  it "is not valid without an ingredient_id" do
  dish=Dish.create(dname: "Salad")
  subject=DishesIngredient.new(dish_id: dish.id, ingredient_id: nil)
  expect(subject).to_not be_valid
  end

  # it 'should validate uniqueness of ingredient name' do
  # ingredient=Ingredient.create(iname: "Tomato")
  #   dish=Dish.create(dname: "Salad")
  # subject=DishesIngredient.new(dish_id: dish.id, ingredient_id: ingredient.id)
  # subjectip=DishesIngredient.new(dish_id: dish.id, ingredient_id: ingredient.id)
  #  expect(subjectip).to_not be_valid
  # end

end
