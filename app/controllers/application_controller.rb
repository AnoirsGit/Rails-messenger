class ApplicationController < ActionController::Base
    helper_method :current_user, :is_logged

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def is_logged
        !!current_user
    end 

    def require_user
        if !is_logged
            redirect_to login_path
        end
    end

end
