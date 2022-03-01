class TripsController < ApplicationController
  def index
    @my_trips = current_user.trips
    @my_pending_trips = @my_trips.select { |trip| trip.status == "pending" }
    @my_confirmed_trips = @my_trips.select { |trip| trip.status == "confirmed" }
    @my_passed_trips = @my_trips.select { |trip| trip.status == "passed" }
  end

  def new
    @availabilities = Availability.new
    @place_proposal = PlaceProposal.new
    @trip = Trip.new
  end
end
