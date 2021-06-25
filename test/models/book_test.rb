require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'Book is valid' do
    @book = Book.new(title: 'Dhruv', author: 'check', rating: 1)
    assert @book.valid?
  end

  test 'Title cannot be empty' do
    @book = Book.new(title: '', author: 'check', rating: 1)
    assert_not @book.valid?
  end

  test 'Author cannot be empty' do
    @book = Book.new(title: 'Test', author: ' ', rating: 1)
    assert_not @book.valid?
  end

  test 'Rating cannot be empty' do
    @book = Book.new(title: 'Test', author: 'check', rating: ' ')
    assert_not @book.valid?
  end

  test 'Rating cannot be string' do
    @book = Book.new(title: 'Test', author: 'check', rating: 'Test')
    assert_not @book.valid?
  end

  test 'Rating cannot be greater than 5' do
    @book = Book.new(title: 'Test', author: 'check', rating: 6)
    assert_not @book.valid?
  end

  test 'Rating cannot be less than 0' do
    @book = Book.new(title: 'Test', author: 'check', rating: -1)
    assert_not @book.valid?
  end
end
