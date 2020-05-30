require 'test_helper'

class MenuPlannersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_planner = menu_planners(:one)
  end

  test "should get index" do
    get menu_planners_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_planner_url
    assert_response :success
  end

  test "should create menu_planner" do
    assert_difference('MenuPlanner.count') do
      post menu_planners_url, params: { menu_planner: { date: @menu_planner.date, dish_id: @menu_planner.dish_id, dish_type: @menu_planner.dish_type } }
    end

    assert_redirected_to menu_planner_url(MenuPlanner.last)
  end

  test "should show menu_planner" do
    get menu_planner_url(@menu_planner)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_planner_url(@menu_planner)
    assert_response :success
  end

  test "should update menu_planner" do
    patch menu_planner_url(@menu_planner), params: { menu_planner: { date: @menu_planner.date, dish_id: @menu_planner.dish_id, dish_type: @menu_planner.dish_type } }
    assert_redirected_to menu_planner_url(@menu_planner)
  end

  test "should destroy menu_planner" do
    assert_difference('MenuPlanner.count', -1) do
      delete menu_planner_url(@menu_planner)
    end

    assert_redirected_to menu_planners_url
  end
end
