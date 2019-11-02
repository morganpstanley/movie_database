class UsersController < ApplicationController

    def show
    end
    
    def index
    end

    def new
        @user = User.new
    end

    def create
        binding.pry
        @user = User.new(user_params)
    end

private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :email)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
