require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test 'Movie is valid' do
    @movie = Movie.new(title: 'Dhruv', director: 'check', rating: 1)
    assert @movie.valid?
  end

  test 'Title cannot be empty' do
    @movie = Movie.new(title: '', director: 'check', rating: 1)
    assert_not @movie.valid?
  end

  test 'Director cannot be empty' do
    @movie = Movie.new(title: 'Test', director: ' ', rating: 1)
    assert_not @movie.valid?
  end

  test 'Rating cannot be empty' do
    @movie = Movie.new(title: 'Test', director: 'check', rating: ' ')
    assert_not @movie.valid?
  end

  test 'Rating cannot be string' do
    @movie = Movie.new(title: 'Test', director: 'check', rating: 'Test')
    assert_not @movie.valid?
  end

  test 'Rating cannot be greater than 5' do
    @movie = Movie.new(title: 'Test', director: 'check', rating: 6)
    assert_not @movie.valid?
  end

  test 'Rating cannot be less than 0' do
    @movie = Movie.new(title: 'Test', director: 'check', rating: -1)
    assert_not @movie.valid?
  end
end
