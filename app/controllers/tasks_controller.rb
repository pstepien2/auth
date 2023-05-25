class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new
    @task["description"] = params["task"]["description"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    @task.destroy
    redirect_to "/tasks"
  end
end
