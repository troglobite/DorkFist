require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new
    assert_response :success
  end

  test "should get create" do
    post '/user'
    assert_response :success
  end

end
