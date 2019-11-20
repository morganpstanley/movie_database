module UsersHelper
    def current_user
        User.find_by(id: session[:user_id])
    end

    def login_through_github
        button_to('Log in with Github', '/auth/github')
    end
end
