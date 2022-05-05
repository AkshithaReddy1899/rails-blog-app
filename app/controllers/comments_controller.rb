class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    new_comment = Comment.new(post_params)
    redirect_to user_post_path(new_comment.author_id, new_comment.post_id) if new_comment.save
    redirect_to "/users/#{@new_comment.author.id}.posts/#{new_comment.post_id}", notice: 'Success!'
  end

  def post_params
    params.require(:comment).permit(:Text)
  end
end
