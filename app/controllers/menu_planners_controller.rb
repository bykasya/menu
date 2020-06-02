class MenuPlannersController < ApplicationController
  before_action :set_menu_planner, only: [:show, :edit, :update, :destroy]


  # GET /menu_planners
  # GET /menu_planners.json
  def index
    @menu_planners=MenuPlanner.all
    @today = Date.current
    @this_week = @today.all_week  #returns a range (Mo...Sun) for the week of specific day
    #@week_from_today=[@today, @today+1, @today+2, @today+3, @today+4, @today+5, @today+6]
    @generated_week_menu = {}
    @menu_planners.each do |mp|
      if @this_week.include?(mp.date)
        @generated_week_menu=@generated_week_menu.deep_merge({mp.date=>{mp.dish_type=>mp.dish}})
      end
    end
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
    puts YAML::dump(menu_planner_params)
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

  def newweek
    @today = Date.current
    @week_from_today=[@today, @today+1, @today+2, @today+3, @today+4, @today+5, @today+6]
    @dishes=Dish.all
    @generated_week_menu = []
      @week_from_today.each do |day|
        @day_menu = []
      #  @generated_week_menu.push(day)
        k=rand(@dishes.size)   #finds the position number in array of all dishes
        @day_menu.push(k)
        dishtype=1                    #dishtype 1-breakfast, 2-lunch, 3-dinner
          3.times do
          #  @generated_week_menu.push([@dishes[k],dishtype])
          # params = {"menu_planner"=>{"date(1i)"=>"2020", "date(2i)"=>"8", "date(3i)"=>"31", "dish_type"=>"1", "dish_id"=>"1"}}
          #  @Menu_item = MenuPlanner.new(params)
          #  @Menu_item.save
            loop do
              k=rand(@dishes.size)
              break if !@day_menu.include?(k) # to avoid repetitions in day
            end
            dishtype +=1
          end
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
