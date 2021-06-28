require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @book = Book.create(title: 'Test', author: 'Test', rating: 1)
    @user = User.create(name: 'Test', email: 'Test@gmail.com', password: '123')
  end

  test 'Post is valid' do
    @post = Post.new(content: 'This is a test post', commentable_type: 'Book', commentable_id: @book.id, user: @user)
    assert @post.valid?
  end
end
