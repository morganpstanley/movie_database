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
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to movie_path(@movie)
        else
            render :new
        end
    end

private

    def movie_params
        params.require(:movie).permit(:name, :director, :release_date, :genre)
    end

    def require_login
        return head(:forbidden) unless session.include?(:user_id)
    end

end
