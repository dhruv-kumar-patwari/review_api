class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_book, only: %i[show update destroy]

  def index
    render json: Book.all
  end

  def show
    render json: @book
  end

  def create
    book = Book.new(book_params)

    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :rating)
  end
end
