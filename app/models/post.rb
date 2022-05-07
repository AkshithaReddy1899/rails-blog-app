class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :likes
  has_many :comments

  validates :Title, presence: true, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { greater_than_or_equal_to: 0}
  validates :LikesCounter, numericality: { greater_than_or_equal_to: 0}
  
  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:PostsCounter)
  end

  def return_five_most_recent_comments
    comments.order('created_at DESC').limit(5)
  end
end
