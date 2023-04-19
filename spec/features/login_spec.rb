require 'rails_helper'

RSpec.feature 'login', type: :feature do
  describe 'authentication' do
    it 'has username input, password input, and Submit button' do
      visit user_session_path
      expect(page).to have_field('Email', type: 'email')
      expect(page).to have_field('Password', type: 'password')
      expect(page).to have_button('Log in', type: 'submit')
    end

    it 'throws an error when all the input fields are blank and Submit button is clicked' do
      visit user_session_path
      fill_in('Email', with: '')
      fill_in('Password', with: '')
      click_button('Log in')
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'throws an error when one of the input fields is blank and Submit button is clicked' do
      visit user_session_path
      fill_in('Email', with: 'name@gmail.com')
      fill_in('Password', with: '')
      click_button('Log in')
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'redirects to root page when a user signs in successfully' do
      visit user_session_path
      fill_in('Email', with: 'name@gmail.com')
      fill_in('Password', with: '')
      click_button('Log in')
      expect(current_path).to have_content('/')
    end
  end
end
