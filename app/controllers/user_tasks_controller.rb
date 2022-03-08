class UserTasksController < ApplicationController
  def done
    @user_task = UserTask.find(params[:id])
    @user_task.done = true
    if @user_task.save
      Message.create(user: current_user, trip: @user_task.task.trip, content: "J'ai complété la tâche : #{@user_task.task.name.capitalize}")
      redirect_to trip_path(@user_task.task.trip)
    end

  end
end
