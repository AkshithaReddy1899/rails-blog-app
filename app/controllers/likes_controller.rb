class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    new_like = current_user.likes.new
    new_like.post_id = @post.id

    if new_like.save
      flash[:notice] = 'Like added'
      redirect_to user_post_path(@post.author_id, @post.id)
    else
      flash[:alert] = 'Like not added. Try again'
      redirect_to user_post_path(@post.author_id, @post.id)
    end
  end
end
