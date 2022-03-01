class TripsController < ApplicationController
  def index
    @my_trips = current_user.trips
    @my_created_trips = @my_trips.select { |trip| trip.status == "created" }
    @my_voting_trips = @my_trips.select { |trip| trip.status == "voting" }
    @my_future_trips = @my_trips.select { |trip| trip.status == "locked" }
    @my_passed_trips = @my_trips.select { |trip| trip.status == "passed" }
  end
end
