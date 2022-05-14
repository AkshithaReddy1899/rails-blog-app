class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).order(created_at: :DESC).page(params[:page]).per(5)
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
    @new_post.LikesCounter = 0
    @new_post.CommentsCounter = 0
    if @new_post.save
      redirect_to "/users/#{@new_post.author.id}.posts/", notice: 'Success!'
    else
      render :new, alert: 'Error! Post not saved try again.'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    user = User.find(@post.author_id)
    @post.destroy
    if @post.destroy
      user.PostsCounter -= 1
      user.save
      flash[:notice] = 'You have deleted this post successfully!'
      redirect_to user_posts_path(user.id)
    else
      flash[:alert] = 'Post not deleted. Try again'
      redirect_to user_post_path(@post.author_id)
    end
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text, :author_id)
  end
end
