class UserTasksController < ApplicationController
  def done
    @user_task = UserTask.find(params[:id])
    @user_task.done = true
    @user_task.save

    redirect_to trip_path(@user_task.task.trip)
  end
end
