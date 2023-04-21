require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires a name' do
      user = User.new(email: 'test@gmail.com', password: 'password')
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  describe 'associations' do
    let(:user) { User.create!(name: 'John Doe', email: 'john@gmail.com', password: 'password') }

    it 'is expected to have many foods' do
      expect(user.foods).to be_empty
      food = user.foods.create!(name: 'Test Food', measurement_unit: 'grams', price: 3.99)
      expect(user.foods).to include(food)
    end

    it 'is expected to have many recipes' do
      expect(user.recipes).to be_empty
      recipe = user.recipes.create!(name: 'Test Recipe', preparation_time: 3, cooking_time: 6, description: 'This is a test recipe')
      expect(user.recipes).to include(recipe)
    end
  end
end
