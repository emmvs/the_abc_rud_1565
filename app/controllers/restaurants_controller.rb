class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # Instance Variable
    @restaurants = Restaurant.all
  end

  def show
    # @restaurant = Restaurant.find(params[:id]) 
  end
  
  def new
    # Empty Shell of Instance
    @restaurant = Restaurant.new
  end

  def create
    # Take the user input through strong params
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant.id)
  end

  # HTTP Request one: Gets us the form
  def edit
    # @restaurant = Restaurant.find(params[:id])
  end

  # HTTP Request posts use user info
  def update
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant.id)
  end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    # We need strong params to validate the input coming thru
    params.require(:restaurant).permit(:name, :rating, :address)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
