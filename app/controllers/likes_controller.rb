class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    new_like = current_user.likes.new
    new_like.post_id = @post.id
    new_like.save
    redirect_to user_post_path(@post.author_id, @post.id)
  end
end
