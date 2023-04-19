class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  
  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.recipe_foods.where(recipe: @recipe)
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_url, notice: 'Recipe was successfully created.'
    else
      redirect_to recipes_path, alert: 'Something went wrong! Try again'
    end
  end

  def destroy
    respond_to do |format|
      format.html do
        if @recipe.destroy
          redirect_to recipes_path, notice: 'Recipe deleted successfully'
        else
          redirect_to recipes_path, alert: 'Something went wrong! Try again'
        end
      end
    end
  end

  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooking_time, :preparation_time)
  end
end
