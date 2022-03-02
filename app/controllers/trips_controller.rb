class TripsController < ApplicationController
  def index
    @my_trips = current_user.trips

    @my_pending_trips   = @my_trips.select { |trip| trip.status == "pending" }
    @my_confirmed_trips = @my_trips.select { |trip| trip.status == "confirmed" }
    @my_passed_trips    = @my_trips.select { |trip| trip.status == "passed" }

    @markers = []
    @my_trips.each do |trip|
      place_proposal = PlaceProposal.where(id: trip.place_proposal_id).first
      place = Place.where(id: place_proposal.place_id).first
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
end
