class SportsController < ApplicationController 
  before_action :require_admin, except: [:index, :show]
  before_action :set_sport, only: [:show, :edit, :update, :destroy]

  def index
    @sports = Sport.all
    @q = Sport.ransack(params[:q])
    @sports = @q.result(distinct: true)
  end

  def show
    # @sport = Sport.find(:id)
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      redirect_to sports_path, notice: 'Sport facility was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @sport = Sport.find(:id)
  end

  def update
    if @sport.update(sport_params)
      redirect_to sports_path, notice: 'Sport facility was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sport.destroy
    redirect_to sports_url, notice: 'Sport facility was successfully destroyed.'
  end

  private

  def set_sport
    @sport = Sport.find(params[:id])
  end

  def sport_params
    params.require(:sport).permit(:name, :location, :pincode, :price, :image, :description)
  end

end