require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: 'Example User', email: 'user@example.com')
  end

  test 'user valid login' do
    get login_path
    post login_path, params: { session: { user_id: @user.id } }
    assert_redirected_to @user
  end
end
