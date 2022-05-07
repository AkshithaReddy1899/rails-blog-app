require 'rails_helper'

RSpec.describe Post, type: :model do

  before do(:all)
    @post = Post.new(Title: 'Hello', Text: 'Hello World!',CommentsCounter:2 , LikesCounter: 0, author_id: 3 )
  end

  it 'Title should be present' do
    @post.Title = nil
    expect(@post).to_not be_valid
  end

  it "Text should be present" do
    @post.Text = nil
    expect(@post).to_not be_valid
  end

  it "CommentsCounter should be greater than or equal to 0" do
    expect(@post.CommentsCounter).to be >=0
  end

  it "LikesCouter should be greater than or equal to 0" do
    expect(@post.LikesCounter).to be >=0
  end

  it 'Should return five most recent comments' do
    length = @post.return_five_most_recent_comments.length
    expect(length).to be <= 5
  end
end 