class PlaceProposalsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @place_proposal = PlaceProposal.new(place_params)
    @place_proposal.trip = @trip
    @place_proposal.user = current_user
    @place_proposal.save

    redirect_to trips_path
  end

  private

  def place_params
    params.require(:place_proposal).permit(:place_id)
  end
end
