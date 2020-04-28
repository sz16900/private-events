require 'test_helper'

class UsersLogoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: 'Example User', email: 'user@example.com')
  end

  test 'user valid logout' do
    get login_path
    post login_path, params: { session: { user_id: @user.id } }
    assert_redirected_to @user
    delete logout_path
    assert_nil session[:user_id]
  end
end
