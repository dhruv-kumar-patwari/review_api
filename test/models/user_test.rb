require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'User is valid' do
    @user = User.new(name: 'Dhruv', email: 'dhruv@gmail.com', password: 'test')
    assert @user.valid?
  end

  test 'Name cannot be empty' do
    @user = User.new(name: ' ', email: 'dhruv@gmail.com', password: 'test')
    assert_not @user.valid?
  end

  test 'Email cannot be empty' do
    @user = User.new(name: 'Dhruv', email: ' ', password: 'test')
    assert_not @user.valid?
  end

  test 'Email has to be valid' do
    @user = User.new(name: 'Dhruv', email: 'dhruvgmail.com', password: 'test')
    assert_not @user.valid?
  end

  test 'Email has to be unique' do
    @user = User.new(name: 'Dhruv', email: 'dhruv@gmail.com', password: 'test')
    @user.save
    @user2 = User.new(name: 'Dhruv2', email: 'dhruv@gmail.com', password: 'test')
    assert_not @user2.valid?
  end
end
