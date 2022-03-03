class TripAvailabilitiesController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @trip_availabilities = @trip.trip_availabilities

    @place_proposal = PlaceProposal.new
    @availabilities = Availability.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @availabilities = Availability.new(params_availabilities)
    @availabilities.trip_id = @trip.id
    @availabilities.user_id = current_user.id
    @availabilities.save

    redirect_to new_trip_availability_path(@trip)
  end

  def params_availabilities
    params.require(:availability).permit(:availability)
  end
end
