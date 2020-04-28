require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'new session' do
    get login_path
    assert_response :success
  end
end
