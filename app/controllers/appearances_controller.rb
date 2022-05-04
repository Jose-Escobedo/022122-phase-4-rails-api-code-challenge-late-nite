class AppearancesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_not_valid
  
    def create
        appearance = Appearance.create!(appearance_params)
        render json: appearance, include: ['episode', 'guest'], status: :created
    end
  
  
    private
  
    def appearance_params
      params.permit(:rating, :episode_id, :guest_id)
    end 
  
    def render_not_found_response
        render json: { error: "Appearance not found" }, status: :not_found
    end
    
    def render_not_valid(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end