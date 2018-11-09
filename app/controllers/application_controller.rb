class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end

    def require_valid_user! 
        if current_user.nil?
            flash[:error] = "You must be logged in to access that page"
            redirect_to login_path
        end
    end
end
