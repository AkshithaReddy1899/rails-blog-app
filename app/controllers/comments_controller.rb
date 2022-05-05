class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
    @post = Post.find(params[:post_id])
  end
  def create
    @new_comment = current_user.comments.new(comment_params)
    respond_to do |format|
      format.html do
        if @new_comment.save
          redirect_to "/users/#{@new_comment.author.id}.posts/", notice: 'Success!'
        else
          render :new, alert: 'Error! Post not saved try again.'
        end
      end
    end
  end
  def comment_params
    params.require(:comment).permit(:Text)
  end
end
