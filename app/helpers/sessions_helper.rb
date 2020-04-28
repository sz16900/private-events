module SessionsHelper
  def current_user
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !current_user.nil?
  end

  def login(user_id)
    session[:user_id] = user_id
  end
end
