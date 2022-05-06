class CommentsController < ApplicationController
	def new
    @comment = Comment.new
  end

  def create
		@comment = Comment.new
    @post = Post.find(params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = @post.id
		@comment.Text = params[:text]

    if @comment.save
      redirect_to "/users/#{params[:user_id]}/posts"
		end
	end
end
