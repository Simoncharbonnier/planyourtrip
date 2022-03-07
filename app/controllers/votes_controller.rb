class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @vote.place_proposal_id = place_params[:pp]
    @vote.user = current_user
    @vote.save

    redirect_to trips_path
  end

  private

  def place_params
    params.permit(:pp, :trip_id)
  end
end
