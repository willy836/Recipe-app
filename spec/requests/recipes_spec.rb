require 'rails_helper'

describe '/recipes', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Ellon', email: 'ellon@gmail.com', password: 'password', confirmed_at: Time.now) }
  let(:recipe) { user.recipes.create(name: 'tequila mojito', preparation_time: '10', cooking_time: 10, description: "The  combination of good aged tequila, mint, and sugary syrup", public: true) }

  describe 'GET /index' do
    before(:example) do
      sign_in user
      get recipes_path
    end

    it 'has a successful response' do
      expect(response).to be_successful
    end
    it 'correctly renders the index html template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    before do
        sign_in user
        get new_recipe_path
    end

    it 'has a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    before do
      sign_in user
      get new_recipe_path
    end

    it 'should create a new recipe' do
      expect do
        post recipes_path, params: { recipe: { name: 'Tequila Mojito', preparation_time: '10', cooking_time: 10, description: "The  combination of good aged tequila, mint, and sugary syrup", public: true} }
      end.to change(Recipe, :count).by(1)
    end

    it 'should redirect to recipes_path' do
      post recipes_path, params: { recipe: { name: 'Tequila Mojito', preparation_time: '10', cooking_time: 10, description: "The  combination of good aged tequila, mint, and sugary syrup", public: true } }
      expect(response).to redirect_to recipes_path
    end
  end

  describe 'DELETE /destroy' do
    it 'should delete a recipe' do 
      sign_in user
      recipe
      expect do
        delete recipe_path(recipe)
      end.to change(Recipe, :count).by(-1)
    end
  end
end