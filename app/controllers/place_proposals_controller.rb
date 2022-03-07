class PlaceProposalsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    unless PlaceProposal.where(user: current_user, trip: @trip)
      @place_proposal = PlaceProposal.new(place_params)
      @place_proposal.trip_id = @trip.id
      @place_proposal.user_id = current_user.id
      @place_proposal.save

      @subscription = Subscription.new(user_id: current_user.id, trip_id: @trip.id, status: "pending")
      @subscription.save
    end
    redirect_to trips_path
  end

  private

  def place_params
    params.require(:place_proposal).permit(:place_id)
  end
end
