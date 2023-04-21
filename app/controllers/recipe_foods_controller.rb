class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[edit create destroy]

  def new
    @recipe_food = RecipeFood.new
    @foods = Food.where(user: current_user)
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]

    if @recipe_food.save
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Ingredient has been added successfully!'
    else
      flash[:alert] = 'Something went wrong'
      redirect_to recipe_path(@recipe_food.recipe_id), alert: 'Error, Recipe not created!'
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.where(user: current_user)
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.where(user: current_user)

    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe food was successfully updated.'
    else
      flash[:alert] = 'Something went wrong'
    end
  end

  def destroy
    @ingredient = RecipeFood.find(params[:id])
    @ingredient.destroy
    redirect_to recipe_url(params[:recipe_id]), notice: 'Ingredient was successfully destroyed.'
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find_by(id: params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
