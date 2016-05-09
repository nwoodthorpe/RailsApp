require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username:  "George",
                     password: "foobar",
                     password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.username = "a" * 51 #51 character name, confirm it fails
    assert_not @user.valid?
  end

  test "name should be unique" do
    user2 = @user.dup
    assert_not user2.valid?
  end

  test "password_should_not_be_blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password_should_be_longer_than_six_chars" do
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end

  test "password_should_be_shorter_than_fifty_chars" do
    @user.password = @user.password_confirmation = "a" * 51
    assert_not @user.valid?
  end

end
