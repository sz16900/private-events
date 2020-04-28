require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test 'new user' do
    get new_user_path
    assert_response :success
  end
end
