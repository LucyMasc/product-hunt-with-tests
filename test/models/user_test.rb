require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'invalid without first name' do
    user = User.new(last_name: "Doe", email:'john@doe.com', password: '123456')
    refute user.valid?, 'user is valid without a first name'
    # assert_not_nil user.errors[:first_name].nil?, 'no validation error for :first_name present'
  end

  test 'invalid without last name' do
    user = User.new(first_name: 'John', email:'john@doe.com', password: '123456')
    refute user.valid?, 'user is valid without a last name'
  end

  test 'invalid without email' do
    user = User.new(first_name: 'John', email:'john@doe.com', password: '123456')
    refute user.valid?, 'user is valid without an email'
  end

  test 'invalide without a password' do

  end



  # test "valid user" do
  #   user = User.new(first_name: "John", last_name: "Doe", email:'john@doe.com', password: '123456')
  #   assert user.valid?
  # end

  # test "invalid without a name" do
  #   user = User.new(email:'john@doe.com')
  #   refute user.valid?, 'user is valid without a name'
  #   assert_not_nil user.errors[:first_name], 'no validation error for name present'
  # end

  # test "invalid without an email" do
  #   user = User.new(first_name: "John", last_name: "Doe")
  #   refute user.valid?
  #   assert_not_nil user.errors[:email]
  # end
end

