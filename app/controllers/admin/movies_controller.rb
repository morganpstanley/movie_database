class Admin::MoviesController < ApplicationController

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

    def edit
        @movie = Movie.find_by(id: params[:id])
    end

    def update
        movie = Movie.find_by(id: params[:id])
        movie.update(movie_params)
        redirect_to movie_path(movie)
    end

private

    def movie_params
        params.require(:movie).permit(:name, :director, :release_date, :genre)
    end

    def require_login
        return head(:forbidden) unless session.include?(:user_id)
    end

end