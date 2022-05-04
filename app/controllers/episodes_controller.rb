class EpisodesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_not_valid
  
    def index
        episodes = Episode.all 
        render json: episodes.to_json(except:[:guests]), status: :ok
    end
  
    def show
        episode = Episode.find(params[:id])
        render json: episode, include:['guests']
    end
  
    def destroy
        episode = Episode.find(params[:id])
        episode.destroy
    end
  
  
    
    private
  
    def render_not_found_response
        render json: { error: "Episode not found" }, status: :not_found
    end
    
    def render_not_valid(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end