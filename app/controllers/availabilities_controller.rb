class AvailabilitiesController < ApplicationController
  def create
    @availability = Availability.new
    @availability.available = "true"
    @availability.user_id = current_user.id
    @availability.trip_availability_id = params[:trip_availability_id]
    @availability.save

    respond_to do |format|
      format.html { redirect_to new_trip_trip_availability_path(@availability.trip_availability.trip) }
      format.text do
        render(
          partial: "trip_availabilities/remove_button",
          locals: { trip_av: @availability.trip_availability, av: @availability },
          formats: [:html]
        )
      end
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy

    respond_to do |format|
      format.html { redirect_to new_trip_trip_availability_path(@availability.trip_availability.trip) }
      format.text do
        render(
          partial: "trip_availabilities/add_button",
          locals: { trip_av: @availability.trip_availability },
          formats: [:html]
        )
      end
    end
  end
end
