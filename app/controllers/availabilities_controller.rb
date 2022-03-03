class AvailabilitiesController < ApplicationController
  def create
    @availability = Availability.new
    @availability.available = "true"
    @availability.user_id = current_user.id
    @availability.trip_availability_id = params[:trip_availability_id]
    @availability.save

    redirect_to new_trip_trip_availability_path(@availability.trip_availability.trip)
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy

    redirect_to new_trip_trip_availability_path(@availability.trip_availability.trip)
  end
end
