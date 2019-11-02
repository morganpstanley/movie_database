class MoviesController < ApplicationController

    def show
        @movie
    end
    
    def index
        @movies = Movie.all
    end

    def new
        @movie = User.new
    end

    def create
        @movie = User.new(movie_params)
        if @movie.save
            redirect_to movie_path(@movie)
        else
            render :new
        end
    end

private

    def movie_params
        params.require(:movie).permit(:name, :director, :release_year :genre)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
