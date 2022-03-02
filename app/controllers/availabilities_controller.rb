class AvailabilitiesController < ApplicationController
  def new
    @trip = Trip.last
    @place_proposal = PlaceProposal.new
    @availabilities = Availability.new
  end

  def create
    @trip = Trip.last
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
