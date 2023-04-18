class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def show; end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.build(recipe_params)
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
