class User < ApplicationRecord
	has_many :posts
	has_many :likes
	has_many :comments

	def return_three_most_recent_posts
		Post.order('created_at DESC').limit(3)
	end
end

User.last.return_three_most_recent_posts