require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Likes counter' do
    before do
      @post = Post.new(Title: 'Title of post', Text: 'Text of post', CommentsCounter: 2, LikesCounter: 1,
                       author_id: 3)
      @like = Like.new(author_id: 3, post: @post)
    end

    it 'should update comments counter' do
      old_likes = @post.LikesCounter
      @like.update_likes_counter
      expect(@post.LikesCounter).to eq(old_likes + 1)
    end
  end
end
