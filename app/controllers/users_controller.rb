class UsersController < ApplicationController

    def show
        @user = User.find_by(username: params[:username])
    end
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params) 
        if @user.save
            session[:user_ud] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end  
    end

private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :email)
    end

    def require_login
        return head(:forbidden) unless session.include?(:user_id)
    end

end
