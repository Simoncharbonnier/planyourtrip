class TripsController < ApplicationController
  def index
    @trip = Trip.new
    @my_trips = current_user.trips
    @my_pending_trips = @my_trips.select { |trip| trip.status == "pending" }
    @my_confirmed_trips = @my_trips.select { |trip| trip.status == "confirmed" }
    @my_passed_trips = @my_trips.select { |trip| trip.status == "passed" }
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    @trip.save

    redirect_to new_trip_availability_path(@trip)
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :duration)
  end
end
