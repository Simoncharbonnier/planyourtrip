class TripsController < ApplicationController
  def index
    @my_trips = current_user.trips
    @my_unlocked_trips = @my_trips.select { |trip| trip.subscription_lock == false }
    @my_locked_trips = @my_trips.select { |trip| trip.subscription_lock == true }
    @my_passed_trips = @my_locked_trips.select { |trip| trip.end_at.to_date < Date.today }
    @my_future_trips = @my_locked_trips.select { |trip| trip.start_at >= Date.today }
  end
end
