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
      flash[:notice] = 'Comment added.'
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
    else
      flash[:alert] = 'Comment not added. Try again.'
      redirect_to "/users/#{current_user.id}/posts}"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    user = User.find(@post.author_id)
    @comment = Comment.find(params[:id])
    @comment.destroy
    if @comment.destroy
      @post.CommentsCounter -= 1
      user.save
      flash[:notice] = "You have deleted this comment successfully!"
      redirect_to user_posts_path(user.id)
    else
      flash[:alert] = 'Comment not deleted. Try again'
      redirect_to user_post_path(@post.author_id)
    end
  end

end