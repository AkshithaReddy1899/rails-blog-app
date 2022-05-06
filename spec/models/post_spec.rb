require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(Title: 'Hello', Text: 'Hello World!',CommentsCounter:2 , LikesCounter: 0, author_id: 3 )}
  
  before { subject.save }

  it 'Title should be present' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it "Text should be present" do
    subject.Text = nil
    expect(subject).to_not be_valid
  end

  it "CommentsCounter should be greater than or equal to 0" do
    expect(subject.CommentsCounter).to be >=0
  end

  it "LikesCouter should be greater than or equal to 0" do
    expect(subject.LikesCounter).to be >=0
  end
end
