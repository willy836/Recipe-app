require 'rails_helper'

RSpec.feature 'foods#index', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create!(name: 'John Doe', email: 'john@gmail.com', password: 'john12345')
    fill_in 'Email', with: 'john@gmail.com'
    fill_in 'Password', with: 'john12345'
    click_button 'Log in'

    visit foods_path

    click_button 'Add Food'

    visit new_food_path

    @food = @user.foods.create!(name: 'Test Food', price: 5.99, measurement_unit: 'grams')

    click_button 'Submit'

    visit foods_path
  end

  it 'should include the added food' do
    expect(page).to have_content 'Test Food'
    expect(page).to have_content 5.99
    expect(page).to have_content 'grams'
  end
end
