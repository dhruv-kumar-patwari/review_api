require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create(name: 'test', email: 'test@gmail.com', password: 'test', admin: true)
    @book = Book.new(title: 'Test', author: 'Test', rating: 1)
    @book.save
    @book2 = Book.new(title: 'Test', author: 'Test', rating: 1)
  end

  test 'should get index' do
    get books_url
    assert_response :success
  end

  test 'should create book' do
    assert_difference('Book.count') do
      post(books_url, params: @book2, as: :json)
    end

    assert_response :created
  end

  test 'should show book' do
    get book_url(@book)
    assert_response :success
  end

  test 'should update book' do
    patch(book_url(@book), params: @book2, as: :json)
    assert_response :success
  end

  test 'should destroy book' do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_response :no_content
  end
end
