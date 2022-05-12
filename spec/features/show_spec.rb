require 'rails_helper'

RSpec.feature "Shows", type: :feature do
  describe "Show page" do
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
      visit user_path(@user1)
    end

    it "has users profile picture" do
      image = page.all('img')
      expect(image.size).to eq(1)
    end

    it "has user's username" do
      expect(page).to have_content(@user1.Name)
    end

    it "has number of post's user has written" do
      expect(page).to have_content(@user1.PostsCounter)
    end

    it "has the user's bio." do
      expect(page).to have_content(@user1.Bio)
    end

    it "has users first three posts" do
      expect(page).to have_content(Post.last.Text)
      expect(page).to have_content(Post.offset(1).last.Text)
      expect(page).to have_content(Post.offset(2).last.Text)
    end

    it "has a button that directs to all posts" do
      expect(page).to have_link("See all posts")
    end

    it "click on post, redirects to users post show page" do
      click_on @post4.Title
      expect(page).to have_current_path(user_post_path(@user1, @post4))
    end

    it 'click on "See all posts", redirects to users post index page' do
      click_on 'See all posts'
      expect(page).to have_current_path(user_posts_path(@user1))
    end
  end
end
