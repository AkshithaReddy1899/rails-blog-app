require 'rails_helper'

RSpec.feature "PostIndices", type: :feature do
  describe "Post index page" do
    before(:each) do
      @user1 = User.create! Name: 'User 1', email: 'user@gmail.com', password: '123456', confirmed_at: Time.now

      @post1 = Post.create(Title: 'Post1', Text: 'post text 1', author: @user1, CommentsCounter: 0, LikesCounter: 0)
      
      @post2 = Post.create(Title: 'Post2', Text: 'post text 2', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      @post3 = Post.create(Title: 'Post3', Text: 'post text 3', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      @post4 = Post.create(Title: 'Post4', Text: 'post text 4', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      visit new_user_session_path
      fill_in "Enter your email", with: 'user@gmail.com'
      fill_in "Enter your password", with: '123456'
      click_button 'Log in'
      visit user_posts_path(@user1)
    end

    it "has users profile picture" do
      image = page.all('img')
      expect(image.size).to eq(1)
    end

    it "has user's username" do
      expect(page).to have_content(@user1.Name)
    end

    it "has number of post's user has written" do
      expect(page).to have_content("Number of posts: #{@user1.PostsCounter}")
    end

    it "has post's title" do
      expect(page).to have_content('post text 1')
    end

    it "See some of post's body" do
      user = User.includes(:posts).first
      post = if user.posts.first.Text.length < 100
        user.posts.first.Text
      else
        truncate(user.posts.first.Text, length: 100, omission: '...')
      end
      expect(page).to have_content(post)
    end
    
    it "See the first comment"
  end
end
