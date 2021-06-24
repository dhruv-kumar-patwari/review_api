class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: %i[show update destroy]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
      render json: @posts
    else
      render json: Post.all
    end
  end

  def show
    render json: @post
  end

  def create
    post = Post.new(post_params)
    post.user_id = @current_user.id

    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @current_user == @post.user
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    else
      render json: { "error": 'You are not authorized to update posts by others' }, status: :unauthorized
    end
  end

  def destroy
    if @current_user == @post.user
      @post.destroy
    else
      render json: { "error": 'You are not authorized to delete posts by others' }, status: :unauthorized
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :commentable_type, :commentable_id)
  end
end
