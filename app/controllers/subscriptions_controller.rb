class SubscriptionsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @subscription = Subscription.new(user_id: current_user.id, trip_id: @trip.id, status: "pending")
    @subscription.save

    redirect_to new_trip_trip_availability_path(@trip)
  end
end
