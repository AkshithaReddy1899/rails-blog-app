require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  describe "login page" do
    before(:each) do
      User.create! Name: "Test", email: "test@gmail.com", password: "123456", confirmed_at: Time.now
      visit new_user_session_path  
    end
    it 'I can see the username and password inputs and the "Submit" button.' do
      expect(page).to have_field('Enter your email')
      expect(page).to have_field('Enter your password')
      expect(page).to have_button('Log in')
    end

    it 'Empty input fields, I get a detailed error.' do
      fill_in 'Enter your email', with: ''
      fill_in 'Enter your password', with: ''
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
    it 'Wrong data, I get a detailed error.' do
      fill_in 'Enter your email', with: 'test.com'
      fill_in 'Enter your password', with: '12340'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
    it 'Correct data. I am redirected to the root page.' do
      fill_in 'Enter your email', with: 'test@gmail.com'
      fill_in 'Enter your password', with: '123456'
      click_button 'Log in'
      expect(page).to have_current_path root_path
    end
  end
end
