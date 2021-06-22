class MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_movie, only: %i[show update destroy]

  def index
    render json: Movie.all
  end

  def show
    render json: @movie
  end

  def create
    movie = Movie.new(movie_params)

    if movie.save
      render json: movie, status: :created
    else
      render json: movie.errors, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :director, :rating)
  end
end
