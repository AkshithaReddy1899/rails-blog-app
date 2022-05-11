class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  validates :Name, presence: true
  validates :PostsCounter, allow_nil: true, numericality: { greater_than_or_equal_to: 0 }

  def return_three_most_recent_posts
    Post.order('created_at DESC').where(author_id: id).limit(3)
  end
end
