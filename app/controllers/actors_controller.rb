class ActorsController < ApplicationController
    def new
        @actor = Actor.new
    end

    def create
        @actor = Actor.new(actor_params)
        if @actor.save
            redirect_to actor_path(@actor)
        else
            render :new
        end
    end

    def show
        @actor = Actor.find_by(id: params[:id])
    end

private

    def actor_params
        params.require(:actor).permit(:name, :movie_id)
    end
end
