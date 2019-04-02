class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :user_signed_in?
        
    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end 
    end

    def user_signed_in?
        session[:user_id].present?
    end

    def authenticate_user
        redirect_to new_session_path, alert: 'please sign in' unless user_signed_in?
    end
    
end
