class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def all
    @tasks = Task.all
  end
  def show
    @completed = @task.completed ? 'This task is completed' : 'This task is not completed yet'
    @checked = @task.completed ? "checked='checked'" : ""
  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end
  def edit
  end
  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end
  def destroy
    @task.destroy
    redirect_to tasks_path
  end
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
end
