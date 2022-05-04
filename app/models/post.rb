# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :likes
  has_many :comments
  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:PostsCounter)
  end

  def return_five_most_recent_comments
    comments.order('created_at DESC').limit(5)
  end
end
