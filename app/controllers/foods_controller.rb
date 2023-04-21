class FoodsController < ApplicationController
  before_action :set_user, only: %i[index new]

  def index
    @foods = @user.foods
  end

  def new
    @food = @user.foods.new
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food was successfully added.'
    else
      flash.now[:alert] = 'Failed to add food.'
      render :new
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    if @food.destroy
      redirect_to foods_path, notice: 'Food deleted successfully.'
    else
      redirect_to foods_path, notice: 'An error occurred when deleting the food.'
    end
  end

  private

  def set_user
    @user = User.includes(:foods).find(current_user.id)
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
