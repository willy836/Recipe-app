require 'rails_helper'

describe 'recipes/new', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Ellon', email: 'ellon@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Orange Bomb', description: 'Orange and lime vodka', public: true, cooking_time: 3,
        preparation_time: 1 , user: @user)
    sign_in @user
    visit new_recipe_path
  end

  it 'renders new recipe form' do
    expect(page).to have_content 'Public'
  end

  it 'submits form' do
    fill_in 'Name', with: 'Mint sake'
    fill_in 'Preparation time', with: 1
    fill_in 'Cooking time', with: 1
    fill_in 'Description', with: 'tasty'
    click_on 'Create Recipe'
    expect(page).to have_content 'Recipe was successfully created.'
  end
end