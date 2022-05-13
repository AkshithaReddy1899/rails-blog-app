require 'rails_helper'

RSpec.feature 'Indices', type: :feature do
  describe 'Index page' do
    before(:each) do
      @user1 = User.create! Name: 'User 1', email: 'user@gmail.com', password: '123456', confirmed_at: Time.now
      @user2 = User.create! Name: 'User 2', email: 'user2@gmail.com', password: '123456', confirmed_at: Time.now

      @post1 = Post.create(Title: 'Post', Text: 'post text', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      visit new_user_session_path
      fill_in 'Enter your email', with: 'user@gmail.com'
      fill_in 'Enter your password', with: '123456'
      click_button 'Log in'
      visit root_path
    end

    it 'Shows the username of other users' do
      expect(page).to have_content('User 1')
      expect(page).to have_content('User 2')
    end

    it 'shows photo for all users' do
      image = page.all('img')
      expect(image.size).to eql(2)
    end

    it 'shows number of posts for each user' do
      post = Post.first
      expect(page).to have_content(post.CommentsCounter)
    end

    it "on click user directs to that user's show page." do
      user = User.last
      click_on user.Name
      expect(page).to have_current_path(user_path(user))
    end
  end
end
