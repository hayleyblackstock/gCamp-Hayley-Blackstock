class TasksController < ApplicationController

  before_action :authenticate

  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @project = Project.find(params[:project_id])
    @tasks = Task.all
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(task_params)
  end

  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def edit
    @project = Project.find(params[:project_id])
    @task.project_id = @project.id
  end

  def create
    @project  = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @task.project_id = @project.id
      if @task.save
        redirect_to project_tasks_path(@project), notice: 'Task was successfully created.'
      else
        render :new
      end
    end

  def update
    @project  = Project.find(params[:project_id])
      if @task.update(task_params)
        redirect_to project_path(@project), notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end


  def destroy
    @project  = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @task.destroy
      redirect_to project_tasks_path(@project), notice: 'Task was successfully destroyed.'
    end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:description, :due, :completed, :project_id)
  end
end
# class TasksController < ApplicationController
#   before_action :set_task, only: [:show, :edit, :update, :destroy]
#   before_action :authenticate
#
#   def index
#     @project = Project.find(params[:project_id])
#   end
#
#   def show
#     @project = Project.find(params[:project_id])
#     @task = @project.tasks.find(params[:id])
#   end
#
#   def new
#     @project = Project.find(params[:project_id])
#     @task = Task.new
#   end
#
#   def create
#     @project = Project.find(params[:project_id])
#     @task = Task.new(task_params)
#     @task.project_id = @project.id
#
#     if @task.save
#       redirect_to project_tasks_path(@project), notice: "Task was successfully created!"
#     else
#       render :new
#     end
#   end
#
#   def edit
#     @project = Project.find(params[:project_id])
#     @task.project_id = params[:project_id]
#   end
#
#   def update
#     @project = Project.find(params[:project_id])
#     @task.project_id = params[:project_id]
#     if @task.update(task_params)
#       redirect_to project_path(@task.project_id), notice: "Task was successfully updated!"
#     else
#       render :edit
#     end
#   end
#
#   def destroy
#     @project = Project.find(params[:project_id])
#     @task.project_id = params[:project_id]
#     @task.destroy
#     redirect_to project_tasks_path(@project), notice: "One less thing to do!"
#   end
#
#   private
#   def set_task
#     @task = Task.find(params[:id])
#   end
#
#   def task_params
#     params.require(:task).permit(:description, :duedate, :completed, :project_id)
#   end
# end
