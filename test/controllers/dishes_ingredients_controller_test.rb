require 'test_helper'

class DishesIngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dishes_ingredient = dishes_ingredients(:one)
  end

  test "should get index" do
    get dishes_ingredients_url
    assert_response :success
  end

  test "should get new" do
    get new_dishes_ingredient_url
    assert_response :success
  end

  test "should create dishes_ingredient" do
    assert_difference('DishesIngredient.count') do
      post dishes_ingredients_url, params: { dishes_ingredient: { dish_id: @dishes_ingredient.dish_id, ingredient_id: @dishes_ingredient.ingredient_id } }
    end

    assert_redirected_to dishes_ingredient_url(DishesIngredient.last)
  end

  test "should show dishes_ingredient" do
    get dishes_ingredient_url(@dishes_ingredient)
    assert_response :success
  end

  test "should get edit" do
    get edit_dishes_ingredient_url(@dishes_ingredient)
    assert_response :success
  end

  test "should update dishes_ingredient" do
    patch dishes_ingredient_url(@dishes_ingredient), params: { dishes_ingredient: { dish_id: @dishes_ingredient.dish_id, ingredient_id: @dishes_ingredient.ingredient_id } }
    assert_redirected_to dishes_ingredient_url(@dishes_ingredient)
  end

  test "should destroy dishes_ingredient" do
    assert_difference('DishesIngredient.count', -1) do
      delete dishes_ingredient_url(@dishes_ingredient)
    end

    assert_redirected_to dishes_ingredients_url
  end
end
