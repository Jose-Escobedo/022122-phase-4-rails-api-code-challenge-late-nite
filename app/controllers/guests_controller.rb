class GuestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_not_valid

  def index
    guests = Guest.all 
    render json: guests, status: :ok
  end


  private

  def render_not_found_response
      render json: { error: "Guest not found" }, status: :not_found
  end
  
  def render_not_valid(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end