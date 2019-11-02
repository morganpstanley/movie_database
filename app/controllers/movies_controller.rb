class MoviesController < ApplicationController

    def show
    end
    
    def index
    end

    def new
        @user = User.new
    end

    def create
        binding.pry
        @user = User.new(user_params)
    end

end
