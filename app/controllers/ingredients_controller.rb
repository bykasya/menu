class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, :with => :my_ing_error


  # GET /ingredients
  def index
    @ingredient = Ingredient.new
    all_ingredients
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)
    all_ingredients
      if @ingredient.save
        redirect_to ingredients_path, notice: 'Ingredient was successfully created.'
      else
       render :index
      end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
      if @ingredient.update(ingredient_params)
        redirect_to ingredients_path, notice: 'Ingredient was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
      redirect_to ingredients_path, notice: 'Ingredient was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def all_ingredients
      @ingredients = Ingredient.all

    end

    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.require(:ingredient).permit(:iname)
    end

    def my_ing_error
        redirect_to ingredients_path, notice: "Ingredient with this ID not exist"
    end
end
