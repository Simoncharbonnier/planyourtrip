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
  end

  def show
    @trip = Trip.find(params[:id])
    @message = Message.new
    @messages = @trip.messages.order('created_at DESC')
    @task = Task.new
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

    Task.create(trip: @trip, name: "Réserver les billets")
    Task.create(trip: @trip, name: "Réserver l'hébergement")

    weeks = Date.new(2022, @trip.month, 1).week_split
    if @trip.time_span == "Semaine"
      weeks.each do |week|
        sa = Date.new(2022, @trip.month, week[0]) unless week[0].nil?
        ea = Date.new(2022, @trip.month, week[6]) unless week[6].nil?
        if sa && ea
          @ta = TripAvailability.new(trip: @trip, start_at: sa, end_at: ea)
          @ta.save
        end
      end
    else
      weeks.each do |week|
        sa = Date.new(2022, @trip.month, week[4]) unless week[4].nil?
        ea = Date.new(2022, @trip.month, week[6]) unless week[6].nil?
        if sa && ea && (sa.month == ea.month)
          @ta = TripAvailability.new(trip: @trip, start_at: sa, end_at: ea)
          @ta.save
        end
      end
    end

    @subscription = Subscription.new(user_id: current_user.id, trip_id: @trip.id, status: "pending")
    @subscription.save

    redirect_to new_trip_trip_availability_path(@trip)
  end

  def book
    @trip = Trip.find(params[:id])
    @trip.trip_availability_id = TripAvailability.find(params[:trip_av])
    @trip.status = "voting"
    @trip.save

    redirect_to trip_path(@trip)
  end

  def set_place
    @trip = Trip.find(params[:id])
    @trip.place_proposal = PlaceProposal.find(params[:ta_id])
    @trip.save

    redirect_to new_trip_trip_availability_path(@trip)
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :month, :time_span)
  end
end
