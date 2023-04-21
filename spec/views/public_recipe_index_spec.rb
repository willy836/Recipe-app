require 'rails_helper'

describe 'public_recipes/index', type: :view do
  include Devise::Test::IntegrationHelpers
  before(:example) do
    @user = User.create(name: 'Ellon', email: 'ellon@gmail.com', password: 'password', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Orange Bomb', description: 'Orange and lime vodka', public: true, cooking_time: 3,
        preparation_time: 1 , user: @user)
    sign_in @user
    visit public_recipes_path
  end

  it 'renders a list of recipes' do
    expect(page).to have_content 'Orange bomb'
  end

  it 'click on recipe' do
    find("a[href= '/recipes/#{@recipe.id}']").click
    sleep 1
    expect(current_path).to eql recipe_path(@recipe)
  end
end