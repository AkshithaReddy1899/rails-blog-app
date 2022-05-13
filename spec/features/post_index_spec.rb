require 'rails_helper'

RSpec.feature 'PostIndex', type: :feature do
  describe 'Post index page' do
    before(:each) do
      @user1 = User.create! Name: 'User 1', email: 'user@gmail.com', password: '123456', confirmed_at: Time.now

      @post1 = Post.create(Title: 'Post1', Text: 'post text 1', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      @post2 = Post.create(Title: 'Post2', Text: 'post text 2', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      @post3 = Post.create(Title: 'Post3', Text: 'post text 3', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      @post4 = Post.create(Title: 'Post4', Text: 'post text 4', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      @post5 = Post.create(Title: 'Post5', Text: 'post text 5', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      @post6 = Post.create(Title: 'Post6', Text: 'post text 6', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      @post7 = Post.create(Title: 'Post7', Text: 'post text 7', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      Comment.create(Text: 'Comment 1', author: @user1, post: @post4)

      visit user_posts_path(@user1)

      fill_in 'Enter your email', with: 'user@gmail.com'
      fill_in 'Enter your password', with: '123456'
      click_button 'Log in'
    end

    it 'has users profile picture' do
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
      expect(page).to have_content(@post5.Title)
    end

    it "See some of post's body" do
      post = if @post1.Text.length < 100
               expect(page).to have_content(@post4.Text)
               @post1.Text
             else
               expect(page).to have_content(truncate(@post4.Text, length: 100, omission: '...'))
             end
    end

    it 'See the first comment of a post' do
      expect(page).to have_content(@post4.comments.first.Text)
    end

    it 'See number of comments on a post' do
      expect(page).to have_content("Comments: #{@post1.CommentsCounter}")
    end

    it 'See number of likes on a post' do
      expect(page).to have_content("Likes: #{@post1.LikesCounter}")
    end

    it 'See a link to pagination' do
      expect(page).to have_link('Last')
    end

    it 'When I click on post redirects to post show page' do
      click_on @post4.Title
      expect(page).to have_current_path(user_post_path(@user1, @post4))
    end
  end
end
