# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(Name: 'Tom', Photo: 'user.png', Bio: 'Teacher from Mexico', PostsCounter: 1)
  end

  context 'User validation test' do
    it 'ensures Name presence' do
      @user.Name = ''
      expect(@user).to_not be_valid
    end

    it 'ensures PostsCounter greater than equal to 0' do
      expect(@user.PostsCounter).to be >= 0
    end
  end

  it 'User returns three most recent posts' do
    length = @user.return_three_most_recent_posts.length
    expect(length).to be <= 3
  end
end
