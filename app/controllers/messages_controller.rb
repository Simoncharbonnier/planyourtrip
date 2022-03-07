class MessagesController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @message = Message.new(message_params)
    @message.trip = @trip
    @message.user = current_user
    if @message.save
      redirect_to trip_path(@trip, anchor: "message-#{@message.id}")
    else
      render "trip/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :time_span)
  end
end
