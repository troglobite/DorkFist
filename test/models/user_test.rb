require 'test_helper'

class UserTest < ActiveSupport::TestCase

    def setup
      @user = users(:valid)
    end

    test 'valid user' do
      assert @user.valid?
    end

    test 'invalid without password' do
      @user.password = nil
      refute @user.valid?, 'user valid without a password'
      assert_not_nil @user.errors[:password], 'no validation error for password present'
    end

    test 'invalid without email' do
      @user.email = nil
      refute @user.valid? 'user valid without a email'
      assert_not_nil @user.errors[:email], 'no validation erros for email present'
    end

    test '#post' do
      assert_equal 2, @user.articles.count
    end

    test '#recent' do
      assert_includes User.recent, users(:valid)
      refute_includes User.recent, users(:old)
    end
end
