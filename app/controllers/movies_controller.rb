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

    def new
        @movie = Movie.new
    end

    def create
        movie = Movie.find_by(id: params.require(:movie_id))
        if current_user.movies.exclude?(movie)
            UserMovie.create(movie_id: movie.id, user_id: current_user.id, rating: params.permit(:rating))
        end
        redirect_to user_movies_path(current_user)
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
