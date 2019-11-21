class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def show
        find_user
    end
    
    def index
        @users = User.all
    end

    def new
        redirect_if_logged_in
        @user = User.new
    end

    def create
        @user = User.new(user_params) 
        if params[:user][:password] == params[:user][:password_confirmation] && @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end  
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
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
