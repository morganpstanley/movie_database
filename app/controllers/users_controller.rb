class UsersController < ApplicationController

    def show
        find_user
    end
    
    def index
        @users = User.all
    end

    def new
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

    def signin
        @user = User.new
    end

    def login
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
             redirect_to user_path(@user)
        else
            redirect_to :login
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end

    def add_movie
        movie = Movie.find_by(id: params.require(:movie_id))
        if current_user.movies.exclude?(movie)
            current_user.movies << movie
        end
        redirect_to user_movies_path(current_user)
    end

private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :email)
    end

    def require_login
        return head(:forbidden) unless session.include?(:user_id)
    end

end
