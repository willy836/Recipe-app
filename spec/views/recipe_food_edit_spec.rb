require 'rails_helper'

describe 'recipe_food/edit', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Ellon', email: 'ellon@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Orange Bomb', description: 'Orange and lime vodka', public: true, cooking_time: 3,
                            preparation_time: 1, user: @user)
    @food = Food.create(name: 'orange', measurement_unit: 'kg', price: 3, user: @user)
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 1)
    sign_in @user
    visit edit_recipe_recipe_food_path(@recipe, @recipe_food)
  end

  it 'renders new recipe food form' do
    expect(page).to have_content 'Edit Ingredient'
  end

  it 'has a select field for food' do
    expect(page).to have_select('recipe_food[food_id]')
  end
  it 'has a quantity field' do
    expect(page).to have_field('recipe_food[quantity]')
  end

  it 'has a select field for food' do
    fill_in 'recipe_food[quantity]', with: 2
    find('#recipe_food_food_id').find(:xpath, 'option[1]').select_option
    click_on 'Edit Ingredient'
  end
end
