require "application_system_test_case"

class DishesIngredientsTest < ApplicationSystemTestCase
  setup do
    @dishes_ingredient = dishes_ingredients(:one)
  end

  test "visiting the index" do
    visit dishes_ingredients_url
    assert_selector "h1", text: "Dishes Ingredients"
  end

  test "creating a Dishes ingredient" do
    visit dishes_ingredients_url
    click_on "New Dishes Ingredient"

    fill_in "Dish", with: @dishes_ingredient.dish_id
    fill_in "Ingredient", with: @dishes_ingredient.ingredient_id
    click_on "Create Dishes ingredient"

    assert_text "Dishes ingredient was successfully created"
    click_on "Back"
  end

  test "updating a Dishes ingredient" do
    visit dishes_ingredients_url
    click_on "Edit", match: :first

    fill_in "Dish", with: @dishes_ingredient.dish_id
    fill_in "Ingredient", with: @dishes_ingredient.ingredient_id
    click_on "Update Dishes ingredient"

    assert_text "Dishes ingredient was successfully updated"
    click_on "Back"
  end

  test "destroying a Dishes ingredient" do
    visit dishes_ingredients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dishes ingredient was successfully destroyed"
  end
end
