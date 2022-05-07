class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @new_post = current_user.posts.new(post_params)
        if @new_post.save
          redirect_to "/users/#{@new_post.author.id}/posts/"
          flash[:notice] =  'Success! New post added'
        else
          redirect_to "/users/#{current_user.id}/posts"
          render :new, alert: 'Error! Post not saved try again.'
        end
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
