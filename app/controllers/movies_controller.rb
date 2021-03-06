class MoviesController < ApplicationController
    before_action :require_login

    def show
        @movie = Movie.find_by(id: params[:id])
    end
    
    def index
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @movies = @user.movies
        else
            @movies = Movie.all
        end
    end

    def released_before
        if params[:user_id]
            user = User.find_by(id: params[:user_id])
            @movies = user.movies.released_before(params[:date])
        else
            @movies = Movie.released_before(params[:date])
        end
    end

private

    def require_login
        return head(:forbidden) unless session.include?(:user_id)
    end

end
