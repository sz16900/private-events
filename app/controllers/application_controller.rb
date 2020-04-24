class ApplicationController < ActionController::Base
    def current_user
        @user = User.find_by(id: session[:user_id]) if session[:user_id]
      end
    
    def signed_in?
    !current_user.nil?
    end
end
