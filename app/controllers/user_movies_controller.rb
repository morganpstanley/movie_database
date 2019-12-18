class UserMoviesController < ApplicationController

    def new
        @movie = Movie.new
    end

    def create
        if params[:movie_id].present?
            movie = Movie.find_by(id: params[:movie_id])
            if current_user.movies.exclude?(movie)
                UserMovie.create(movie_id: movie.id, user_id: current_user.id, rating: params.permit(:rating))
            end
            redirect_to user_movies_path(current_user)
        else
            @error = "ERROR: Please choose a movie"
            render :new
        end
    end

    def edit
        @user = current_user
        @movies = current_user.movies
    end

    def destroy
        UserMovie.find_by(movie_id:params.require(:id), user_id:current_user.id).destroy
        redirect_to edit_movie_path
    end

private

    def movie_params
        params.require(:format).to_i
    end


end