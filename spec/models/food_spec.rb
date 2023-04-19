require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    it 'requires a name' do
      food = Food.new(measurement_unit: 'grams', price: 5.99)
      expect(food).not_to be_valid
      expect(food.errors[:name]).to include("can't be blank")
    end

    it 'requires a measurement unit' do
      food = Food.new(name: 'Test Food', price: 5.99)
      expect(food).not_to be_valid
      expect(food.errors[:measurement_unit]).to include("can't be blank")
    end

    it 'requires a non-negative price' do
      food = Food.new(name: 'Test Food', measurement_unit: 'grams', price: -1)
      expect(food).not_to be_valid
      expect(food.errors[:price]).to include('must be greater than or equal to 0')
    end
  end
end
