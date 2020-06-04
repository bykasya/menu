require 'rails_helper'

RSpec.describe "DishesControllers", type: :request do
  describe "get dishes_path" do
   it "renders the index view" do
     FactoryBot.build_list(:dish, 8) #changed to build ???
     get dishes_path
     expect(response.status).to eq(200)
   end
  end

  describe "get dish_path" do
   it "renders the :show template" do
    dish= FactoryBot.create(:dish)
    get dish_path(id: dish.id)
     expect(response.status).to eq(200)
   end
    it "redirects to the index path if the dish id is invalid" do
      get dish_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to dishes_path
    end
 end

  describe "get new_dish_path" do
   it "renders the :new template" do
    dish = FactoryBot.create(:dish)
    get new_dish_path
    expect(response.status).to eq(200)
   end
  end

  describe "get edit_dish_path" do
   it "renders the :edit template" do
    dish = FactoryBot.create(:dish)
    get edit_dish_path(id: dish.id)
    expect(response.status).to eq(200)
   end
 end

  describe "delete a dish record" do
    it "deletes a dish record" do
      dish = FactoryBot.create(:dish)
      delete dish_path(id: dish.id)
      expect change(Dish, :count).from(1).to eq(0)
      expect(response.status).to eq(302)
    end
  end


 end
