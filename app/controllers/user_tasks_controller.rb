class UserTasksController < ApplicationController
  def done
    @user_task = UserTask.find(params[:id])
    @user_task.done = true
    if @user_task.save
      @message = Message.create(user: current_user, trip: @user_task.task.trip, content: "J'ai complété la tâche : #{@user_task.task.name.capitalize}")

      respond_to do |format|
        format.html { redirect_to trip_path(@user_task.task.trip) }
        format.json do
          render json: {
            message: render_to_string(partial: "trips/message", locals: { message: @message }, formats: [:html]),
            task: render_to_string(partial: "trips/complete_task", locals: { task: @user_task.task }, formats: [:html])
          }.to_json
        end
      end

    end
  end
end
