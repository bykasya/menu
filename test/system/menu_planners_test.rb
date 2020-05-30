require "application_system_test_case"

class MenuPlannersTest < ApplicationSystemTestCase
  setup do
    @menu_planner = menu_planners(:one)
  end

  test "visiting the index" do
    visit menu_planners_url
    assert_selector "h1", text: "Menu Planners"
  end

  test "creating a Menu planner" do
    visit menu_planners_url
    click_on "New Menu Planner"

    fill_in "Date", with: @menu_planner.date
    fill_in "Dish", with: @menu_planner.dish_id
    fill_in "Dish type", with: @menu_planner.dish_type
    click_on "Create Menu planner"

    assert_text "Menu planner was successfully created"
    click_on "Back"
  end

  test "updating a Menu planner" do
    visit menu_planners_url
    click_on "Edit", match: :first

    fill_in "Date", with: @menu_planner.date
    fill_in "Dish", with: @menu_planner.dish_id
    fill_in "Dish type", with: @menu_planner.dish_type
    click_on "Update Menu planner"

    assert_text "Menu planner was successfully updated"
    click_on "Back"
  end

  test "destroying a Menu planner" do
    visit menu_planners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Menu planner was successfully destroyed"
  end
end
