require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'validations' do
    it 'has a valid factory' do
      recipe_food = FactoryBot.build(:recipe_food)
      expect(recipe_food).to be_valid
    end
  end
end
