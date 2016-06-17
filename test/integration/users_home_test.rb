require 'test_helper'

class UsersHomeTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "stats infomation display to home" do
    log_in_as(@user)
    get root_path
    assert_match @user.following.count.to_s, response.body
    assert_match @user.followers.count.to_s, response.body
  end
end
