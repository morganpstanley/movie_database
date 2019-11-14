class ApplicationController < ActionController::Base

    def current_user
        User.find_by(id: session[:user_id])
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end

    def redirect_if_logged_in
        if current_user
            redirect_to user_path(current_user)
        end
    end
    
end
