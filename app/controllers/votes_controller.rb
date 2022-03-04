class VotesController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
  end
end
