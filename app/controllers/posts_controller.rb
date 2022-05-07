class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    respond_to do |format|
      format.html do
        if @new_post.save
          redirect_to "/users/#{@new_post.author.id}.posts/", notice: 'Success!'
        else
          render :new, alert: 'Error! Post not saved try again.'
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text, :author_id)
  end
end
