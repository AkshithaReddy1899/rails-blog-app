require 'rails_helper'

# rubocop:disable Metrics/BlockLength

RSpec.feature 'PostShowSpec.rbs', type: :feature do
  describe 'Post show page' do
    before(:each) do
      @user1 = User.create! Name: 'User 1', email: 'user@gmail.com', password: '123456', confirmed_at: Time.now

      @post4 = Post.create(Title: 'Post4', Text: 'post text 4', author: @user1, CommentsCounter: 0, LikesCounter: 0)

      Comment.create(Text: 'Comment 1', author: @user1, post: @post4)
      Comment.create(Text: 'Comment 2', author: @user1, post: @post4)
      Comment.create(Text: 'Comment 3', author: @user1, post: @post4)

      visit user_posts_path(@user1)

      fill_in 'Enter your email', with: 'user@gmail.com'
      fill_in 'Enter your password', with: '123456'
      click_button 'Log in'
    end

    it "Can see post's title" do
      expect(page).to have_content(@post4.Title)
    end

    it "Can see post's author" do
      expect(page).to have_content(@user1.Name)
    end

    it 'can see number of comments' do
      expect(page).to have_content("Comments: #{@post4.CommentsCounter}")
    end

    it 'can see number of likes' do
      expect(page).to have_content("Likes: #{@post4.LikesCounter}")
    end

    it 'can see post body' do
      expect(page).to have_content(@post4.Text)
    end

    it 'can see name of comment author' do
      expect(page).to have_content(Comment.first.author.Name)
    end

    it 'can see comment text' do
      expect(page).to have_content(Comment.first.Text)
    end
  end
end

# rubocop:enable Metrics/BlockLength
