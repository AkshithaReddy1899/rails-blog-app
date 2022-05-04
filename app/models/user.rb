class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'

  has_many :likes
  has_many :comments

  def return_three_most_recent_posts
    Post.order('created_at DESC').where(author_id: id).limit(3)
  end
end
