require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "Invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {username: "", password: "x", password_confirmation: "bar"}
    end
    assert_template 'users/new'
  end

  test "Assert valid submission works" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {username: "TestName", password: "asdfgh", password_confirmation: "asdfgh"}
    end
    assert_template 'users/show'
  end
end
