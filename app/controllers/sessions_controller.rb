class SessionsController < ApplicationController

    def signin
        redirect_if_logged_in
        user = User.new
    end

    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
             redirect_to user_path(@user)
        else
            redirect_to :login
        end
    end

    def create
        if auth
            user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = user.id
            redirect_to '/users'
        else
            user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to '/users'
            else
                render :login
            end
        end
    end

    def logout
        session.destroy
        redirect_to login_path
    end
       
private
       
    def auth
        request.env['omniauth.auth']
    end

end

# skip_before_action :verify_authenticity_token, only: :create