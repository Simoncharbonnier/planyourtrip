class SubscriptionsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @subscription = Subscription.new(user_id: current_user.id, trip_id: @trip.id, status: "accepted")
    @subscription.save

    redirect_to trips_path
  end
end
