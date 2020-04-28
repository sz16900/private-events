class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'user valid signup' do
    get new_user_path
    assert_difference -> { User.count }, 1 do
      post users_path, params: { user: { name: 'new_user',
                                         email: 'new_user@example.com' } }
    end
  end
end
