class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :likes
  has_many :comments

  def update_posts_counter
    author.increment!(:PostsCounter)
  end

  after_save :update_posts_counter

  def return_five_most_recent_posts
    Post.order('created_at DESC').limit(5)
  end
end
