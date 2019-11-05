class ApplicationController < ActionController::Base

    def current_user
        User.find_by(id: session[:user_id])
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end
end
