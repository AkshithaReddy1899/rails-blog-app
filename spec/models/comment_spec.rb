require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comments counter' do
    before do(:all)
      @post = Post.new(Title: "Title of post", Text: "Text of post", CommentsCounter: 2, LikesCounter: 1, author_id: 3)
      @comment = Comment.new(Text: "Hello", author_id: 3, post: @post)
    end

    it 'should update comments counter' do
      old_comments = @post.CommentsCounter
      @comment.update_comments_counter
      expect(@post.CommentsCounter).to eq(old_comments + 1)
    end
  end
end