class PlaceProposalsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @place_proposal = PlaceProposal.new(place_params)
    @place_proposal.trip_id = @trip.id
    @place_proposal.user_id = current_user.id
    @place_proposal.save

    redirect_to trips_path
  end

  private

  def place_params
    params.require(:place_proposal).permit(:place_id)
  end
end
