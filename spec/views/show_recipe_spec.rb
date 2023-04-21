require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Ellon', email: 'ellon@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Orange Bomb', description: 'Orange and lime vodka', public: true, cooking_time: 3,
                            preparation_time: 1, user: @user)
    sign_in @user
    visit recipe_path(@recipe)
  end

  it 'renders recipe details' do
    expect(page).to have_content 'Recipe'
  end

  it 'generates shopping list' do
    click_on 'Generate Shopping List'
    expect(current_path).to eql '/general_shopping_lists'
  end

  it 'click on add ingredient' do
    click_on 'Add ingredient'
    expect(current_path).to eql new_recipe_recipe_food_path(@recipe)
  end
end
