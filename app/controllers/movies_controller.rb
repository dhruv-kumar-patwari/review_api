class MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_movie, only: %i[show update destroy]

  def index
    @movies = Movie.where(nil)
    @movies = Movie.filter(params[:filter]) if params[:filter].present?
    render json: @movies
  end

  def show
    render json: @movie
  end

  def create
    if @current_user.admin
      movie = Movie.new(movie_params)

      if movie.save
        render json: movie, status: :created
      else
        render json: movie.errors, status: :unprocessable_entity
      end
    else
      render json: { "error": 'You are not authorized to add books' }, status: :unauthorized
    end
  end

  def update
    if @current_user.admin
      if @movie.update(movie_params)
        render json: @movie
      else
        render json: @movie.errors, status: :unprocessable_entity
      end
    else
      render json: { "error": 'You are not authorized to update books' }, status: :unauthorized
    end
  end

  def destroy
    if @current_user.admin
      @movie.destroy
    else
      render json: { "error": 'You are not authorized to delete books' }, status: :unauthorized
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :director, :rating)
  end
end
