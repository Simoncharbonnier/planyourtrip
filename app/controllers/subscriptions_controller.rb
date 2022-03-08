class SubscriptionsController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @subscription = Subscription.new
    @subscription.user = current_user
    @subscription.trip = @trip

    if @subscription.save
      redirect_to new_trip_trip_availability_path(@trip)
    else
      render "trip_availabilities/show"
    end
  end
end
