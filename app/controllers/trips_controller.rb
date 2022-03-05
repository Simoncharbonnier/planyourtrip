class TripsController < ApplicationController
  def index
    @trip = Trip.new
    @my_trips = current_user.trips
    @my_pending_trips   = @my_trips.select { |trip| trip.status == "created" }
    @my_voting_trips    = @my_trips.select { |trip| trip.status == "voting" }
    @my_confirmed_trips = @my_trips.select { |trip| trip.status == "confirmed" }
    @my_passed_trips    = @my_trips.select { |trip| trip.status == "passed" }
    @markers = []
    @my_confirmed_trips.each do |trip|

      place_proposal = PlaceProposal.where(id: trip.place_proposal).first
      place = Place.where(id: place_proposal.place).first
      @markers << {
        lat: place.latitude,
        lng: place.longitude,
        info_window: render_to_string(partial: "info_window", locals: { place: place })
      }
    end

    # if params[:template] == "new_with_css"
    #   render "trips/index_with_new_css"
    # else
    #   render 'trips/index'
    # end
  end

  def show
    @trip = Trip.find(params[:id])

    @markers = []
    @trip.place_proposals.each do |trip|
      place =  trip.place
      @markers << {
        lat: place.latitude,
        lng: place.longitude,
        info_window: render_to_string(partial: "info_window", locals: { place: place })
      }
    end
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    @trip.save

    redirect_to new_trip_trip_availability_path(@trip)
  end

  def set_availability
    @trip = Trip.find(params[:id])
    @trip.trip_availability = TripAvailability.find(params[:ta_id])
    @trip.status = "voting"
    @trip.save

    redirect_to trips_path
  end

  def set_place
    @trip = Trip.find(params[:id])
    @trip.place_proposal = PlaceProposal.find(params[:ta_id])
    @trip.save

    redirect_to new_trip_trip_availability_path(@trip)
  end

  def book
    @trip = Trip.find(params[:id])
    @trip.trip_availability_id = TripAvailability.find(params[:trip_av])
    @trip.status = "voting"
    @trip.save

    redirect_to trip_path(@trip)
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :month, :time_span)
  end
end
