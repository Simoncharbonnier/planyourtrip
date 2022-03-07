class TasksController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @task = Task.new(task_params)
    @task.trip = @trip

    if @task.save
      redirect_to trip_path(@trip)
    else
      render "trip/show"
    end
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
