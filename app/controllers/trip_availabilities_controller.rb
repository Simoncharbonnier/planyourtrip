class TripAvailabilitiesController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @trip_availabilities = @trip.trip_availabilities

    @place_proposal = PlaceProposal.new
  end

  def create
  end

  def params_availabilities
    params.require(:availability).permit(:availability)
  end
end
