class PlaceProposalsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @place_proposal = PlaceProposal.new(place_params)
    @place_proposal.trip_id = @trip.id
    @place_proposal.user_id = current_user.id
    @place_proposal.save

    redirect_to new_trip_trip_availability_path(@trip)
  end

  private

  def place_params
    params.require(:place_proposal).permit(:place_id)
  end
end
