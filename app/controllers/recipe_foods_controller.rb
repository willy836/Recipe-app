class RecipeFoodsController < ApplicationController
  before_action :set_recipe, only: %i[edit create destroy]

  def create
    @recipe_food = @recipe.recipe_foods.build(recipe_foods_params)
    if @recipe_food.save
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Ingredient has been added successfully!'
    else
      flash[:alert] = 'Something went wrong'
      redirect_to recipe_path(@recipe.id), alert: 'Error, Recipe not created!'
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.where(user: current_user)
  end

  def destroy
    @ingredient = RecipeFood.find(params{:id})
    @ingredient.destroy
    redirect_to recipe_url(params[:recipe_id]), notice: 'Ingredient was successfully destroyed.'
  end

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
