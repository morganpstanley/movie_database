class SessionsController < ApplicationController

    def create
        User.find_or_create_by_omniauth(auth)
        redirect_to '/users'
    end

    # def create
    #     binding.pry
    #     @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #         u.username = auth['info']['nickname']
    #         u.email = auth['info']['email']
    #         u.password = SecureRandom.hex
    #     end
    #    binding.pry
    #     session[:user_id] = @user.id
       
    #     redirect_to '/users/'
    # end

    def destroy
        session.destroy
        redirect_to login_path
    end
       
private
       
    def auth
        request.env['omniauth.auth']
    end

end

# skip_before_action :verify_authenticity_token, only: :create