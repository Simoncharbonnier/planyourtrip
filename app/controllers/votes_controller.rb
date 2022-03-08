class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @place_proposal = PlaceProposal.find(place_params[:pp])
    @vote.place_proposal = @place_proposal
    @vote.user = current_user
    @vote.save

    @trip = @place_proposal.trip
    @votes_count = @trip.votes.count
    @subs_count = @trip.subscriptions.count

    if @votes_count == @subs_count
      @trip.status = "confirmed"
      @trip.place_proposal_id = @trip.votes.pluck(:place_proposal_id).inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }.sort_by{|_k, v| -v}.first.first
      @trip.save
    end

    redirect_to trips_path
  end

  private

  def place_params
    params.permit(:pp, :trip_id)
  end
end
