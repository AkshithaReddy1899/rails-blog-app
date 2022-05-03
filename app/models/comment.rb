class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comments_counter
    post.increment!(:CommentsCounter)
  end

  after_save :update_comments_counter
end
