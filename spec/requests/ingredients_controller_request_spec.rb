require 'rails_helper'

RSpec.describe "IngredientsControllers", type: :request do
  describe "get ingredients_path" do
   it "renders the index view" do
     FactoryBot.create_list(:ingredient, 4)   #changed to build, does it test properly?
     get ingredients_path
     expect(response.status).to eq(200)
   end
  end

  describe "get ingredient_path" do
   it "renders the :show template" do
    ingredient= FactoryBot.create(:ingredient)
    get ingredient_path(id: ingredient.id)
    expect(response.status).to eq(200)
   end
    # it "redirects to the index path if the ingredient id is invalid" do
    #   get ingredient_path(id: 5000) #an ID that doesn't exist
    #   expect(response).to redirect_to ingredients_path
    # end
  end

  describe "get new_ingredient_path" do
   it "renders the :new template" do
    ingredient = FactoryBot.create(:ingredient)
    get new_ingredient_path
    expect(response.status).to eq(200)
   end
  end

  describe "get edit_ingredient_path" do
   it "renders the :edit template" do
    ingredient = FactoryBot.create(:ingredient)
    get edit_ingredient_path(id: ingredient.id)
    expect(response.status).to eq(200)
   end
  end

  describe "delete a ingredient record" do
    it "deletes a ingredient record" do
      ingredient = FactoryBot.create(:ingredient)
      delete ingredient_path(id: ingredient.id)
      expect change(Ingredient, :count).from(1).to eq(0)
      expect(response.status).to eq(302)
    end
  end

end
