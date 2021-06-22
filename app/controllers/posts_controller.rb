class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: %i[show update destroy]

  def index
    render json: Post.all
  end

  def show
    render json: @post
  end

  def create
    post = Post.new(post_params)

    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :commentable_type, :commentable_id)
  end
end
