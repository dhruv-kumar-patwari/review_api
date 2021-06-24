class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_comment, only: %i[show update destroy]

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = @current_user.id
    comment.post_id = params[:post_id]

    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @current_user == @comment.user
      if @comment.update(comment_params)
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    else
      render json: { "error": 'You are not authorized to update comments by others' }, status: :unauthorized
    end
  end

  def destroy
    if @current_user == @comment.user
      @comment.destroy
    else
      render json: { "error": 'You are not authorized to delete comments by others' }, status: :unauthorized
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
