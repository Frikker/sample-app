require 'test_helper'

class NewUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_users_new_url
    assert_response :success
  end

end
