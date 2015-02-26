class TasksController < ApplicationController

  before_action :authenticate
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit

  end

  def create
    @task = Task.new(task_params)
          if @task.save
        redirect_to @task, notice: 'Task was successfully created.'
      else
        render :new
      end
    end

  def update
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
      redirect_to tasks_path, notice: 'Task was successfully destroyed.'
    end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:description, :due, :completed)
  end
end
