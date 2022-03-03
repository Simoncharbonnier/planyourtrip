class AvailabilitiesController < ApplicationController
  def create
    @availability = Availability.new()
    @availability.available = "true"
    @availability.user_id = current_user.id
    @availability.trip_availability_id = params[:trip_availability_id]
    @availability.save

    redirect_to new_trip_trip_availability_path(@availability.trip_availability.trip)
  end

  def update
    @availability = Availability.find(params[:id])
    if @availability.available == "false"
      @availability.available = "true"
    else
      @availability.available = "false"
    end
    @availability.save

    redirect_to new_trip_trip_availability_path(@availability.trip_availability.trip)
  end
end
