class MenuPlannersController < ApplicationController
  before_action :set_menu_planner, only: [:show, :edit, :update, :destroy]


  # GET /menu_planners
  # GET /menu_planners.json
  def index
    @menu_planners=MenuPlanner.all.page(params[:page])
    @today = Date.current
    @this_week = @today.all_week  #returns a range (Mo...Sun) for the week of specific day
    @generated_week_menu = {}
    @week_ingredients = []  # for list of ingredients
    @menu_planners.each do |mp|
      if @this_week.include?(mp.date)
        @generated_week_menu=@generated_week_menu.deep_merge({mp.date=>{mp.dish_type=>[mp.dish,mp.id]}}) #to assign dish_type/dish to the date
        @week_ingredients.push(DishesIngredient.find(mp.dish_id).ingredient.iname) #to extract ingredients from week dishes
      end
    end
    @week_ingredients=@week_ingredients.uniq # to avoid repetative ingredients
  end

  # GET /menu_planners/1
  # GET /menu_planners/1.json
  def show
  end

  # GET /menu_planners/new
  def new
    @menu_planner = MenuPlanner.new
  end

  # GET /menu_planners/1/edit
  def edit
  end

  # POST /menu_planners
  # POST /menu_planners.json
  def create
    @menu_planner = MenuPlanner.new(menu_planner_params)
    respond_to do |format|
      if @menu_planner.save
        format.html { redirect_to @menu_planner, notice: 'Menu planner was successfully created.' }
        format.json { render :show, status: :created, location: @menu_planner }
      else
        format.html { render :new }
        format.json { render json: @menu_planner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_planners/1
  # PATCH/PUT /menu_planners/1.json
  def update
    respond_to do |format|
      if @menu_planner.update(menu_planner_params)
        format.html { redirect_to @menu_planner, notice: 'Menu planner was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_planner }
      else
        format.html { render :edit }
        format.json { render json: @menu_planner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_planners/1
  # DELETE /menu_planners/1.json
  def destroy
    @menu_planner.destroy
    respond_to do |format|
      format.html { redirect_to menu_planners_url, notice: 'Menu planner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_planner
      @menu_planner = MenuPlanner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_planner_params
      params.require(:menu_planner).permit(:date, :dish_type, :dish_id)
    end
end
